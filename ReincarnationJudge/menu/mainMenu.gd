extends Panel
const PAUSE_MENU = preload("res://menu/pause_menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_menu_exit_button_pressed() -> void:
	if visible:
		get_tree().quit()


func _on_menu_setting_button_pressed() -> void:
	pass # Replace with function body.


func _on_menu_continue_button_pressed() -> void:
	pass # Replace with function body.


func _on_menu_start_button_pressed() -> void:
	pass # Replace with function body.
