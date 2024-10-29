extends Panel
const PAUSE_MENU = preload("res://scene/menu/scene/pause_menu.tscn")
@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta: float) -> void:
	var tree := get_tree()
	if tree.paused==true:
		label.text="pause"
	else:
		label.text = "running"
		
func _on_menu_exit_button_pressed() -> void:
	if visible:
		get_tree().quit()


func _on_menu_setting_button_pressed() -> void:
	pass # Replace with function body.


func _on_menu_continue_button_pressed() -> void:
	Utils.load_game()
	get_tree().change_scene_to_file(Utils.JUDGE_SENCE)

func _on_menu_start_button_pressed() -> void:
	get_tree().change_scene_to_file(Utils.JUDGE_SENCE)
