extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var filename = text.split("\n",true)[0]
	var filepath = "user://save/%s.dat" % filename
	var dir = DirAccess.open(DataServer.directory_path)
	print(filepath)
	if dir.file_exists(filepath):
		DataServer.load_game(filepath)
		DataServer.auto_save_file_path = filepath
		get_tree().change_scene_to_file(Utils.JUDGE_SENCE)
	else:
		print("文件不存在")
