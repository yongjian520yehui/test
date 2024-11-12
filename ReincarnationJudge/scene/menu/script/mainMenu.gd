extends Panel

const PAUSE_MENU = preload("res://scene/menu/scene/pause_menu.tscn")

@onready var label: Label = $Label
@onready var save_menu = $SaveMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	##获取存档目录的存档文件信息，如果没有存档，则继续游戏按钮不显示
	var saveDir: DirAccess = DirAccess.open(DataServer.directory_path)
	if saveDir:
		var saveFilesArray: PackedStringArray  = saveDir.get_files()
		if saveFilesArray.size() > 0:
			$VBoxContainer/MenuContinueButton.visible = true


func _process(_delta: float) -> void:
	##暂停标签显示逻辑
	var tree := get_tree()
	if tree.paused==true:
		label.text="pause"
	else:
		label.text = "running"
	
##退出
func _on_menu_exit_button_pressed() -> void:
	if visible:
		get_tree().quit()

##设置
func _on_menu_setting_button_pressed() -> void:
	pass # Replace with function body.

##继续游戏
func _on_menu_continue_button_pressed() -> void:
	#存档菜单显示
	save_menu.show()


func _on_menu_start_button_pressed() -> void:
	#跳转审判页面
	get_tree().change_scene_to_file(Utils.JUDGE_SENCE)
