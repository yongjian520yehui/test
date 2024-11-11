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
	var saveDir = DirAccess.open(DataServer.directory_path)
	if saveDir:
		var saveFilesArray = saveDir.get_files()
		var saveString :Array
		
		for i in saveFilesArray:
			##获取文件修改时间，utc时间戳
			var unix_time = FileAccess.get_modified_time(DataServer.directory_path+i)
			var time_dict = Time.get_datetime_dict_from_unix_time(unix_time)
			var time_zone = Time.get_time_zone_from_system()
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
			var time = Time.get_datetime_string_from_datetime_dict(time_dict,true)
			print(time)
			var fileName = i.split(".",true)[0]
			saveString.append(fileName+"\n"+"保存时间:"+time)
			
		var saves = get_tree().get_nodes_in_group("save")
		for i in saves:
			if saveString.size()>0 :
				i.text = saveString.pop_front()


func _on_close_pressed():
	self.hide()