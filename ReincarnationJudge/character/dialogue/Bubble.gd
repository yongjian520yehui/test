class_name Bubble
extends MarginContainer

@export var text: String

var text_tween: Tween
var show_right_now: bool = false

@onready var label: Label = $MarginContainer/Label
@onready var nine_patch_rect: NinePatchRect = $NinePatchRect


func _ready() -> void:
	resized.connect(watch_size)
	if not show_right_now:
		z_index = 1
		text_tween = get_tree().create_tween()
		for character in text:
			text_tween.tween_callback(func(): label.text += character).set_delay(0.05)
		
	else:
		z_index = 1
		label.text = text
	add_to_group("bubble")
		
func watch_size() -> void:
	if size.x > 200:
		resized.disconnect(watch_size)
		size.x = 200
		label.autowrap_mode = TextServer.AUTOWRAP_ARBITRARY
