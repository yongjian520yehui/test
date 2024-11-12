extends Control

@onready var background = %Background
@onready var grid_container = %GridContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#获取存档
	_get_saves()
	#设置背景位置
	global_position -= grid_container.size/2
	#获取所有存档按钮
	var saves = get_tree().get_nodes_in_group("save")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#设置背景大小
	background.size = grid_container.size

#获取存档
func _get_saves():
	var saveDir: DirAccess = DirAccess.open(DataServer.directory_path)
	if saveDir:
		var save_files_array: PackedStringArray = saveDir.get_files()
		var save_string_array :Array[String]
		##获取所有存储文件的修改时间
		for i in save_files_array:
			##获取文件修改时间，utc时间戳
			var unix_time: int = FileAccess.get_modified_time(DataServer.directory_path+i)
			var time_dict: Dictionary = Time.get_datetime_dict_from_unix_time(unix_time)
			var time_zone: Dictionary = Time.get_time_zone_from_system()
			##处理时区问题
			var bias = time_zone.bias
			var hours = int( bias / 60)
			var minutes = bias % 60

			time_dict.hour += hours
			time_dict.minute += minutes
			
			if time_dict.minute < 0 :
				time_dict.hour -= 1
				time_dict.minute += 59
			if time_dict.hour < 0 :
				time_dict.hour += 23
				time_dict.day -= 1

			##返回时间字符串
			var time: String = Time.get_datetime_string_from_datetime_dict(time_dict,true)
			print(time)
			var fileName: String = i.split(".",true)[0]
			save_string_array.append(fileName+"\n"+"保存时间:"+time)
		##获取所有存档位，并设置存档名和时间	
		var saves: Array[Node] = get_tree().get_nodes_in_group("save")
		for i in saves:
			if save_string_array.size()>0 :
				i.text = save_string_array.pop_front()


func _on_close_pressed():
	self.hide()
