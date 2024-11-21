extends PanelContainer

@onready var back: MarginContainer = $Back
@onready var front: MarginContainer = $Front

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	back.hide()


func _on_close_button_pressed() -> void:
	hide()


func _on_flip_button_pressed() -> void:
	var is_show = back.visible == false
	back.visible = is_show
	front.visible = not is_show
