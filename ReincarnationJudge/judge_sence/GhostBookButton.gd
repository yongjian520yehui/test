extends TextureButton
@onready var book_ghost: Control = %book_ghost

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _gui_input(event: InputEvent) -> void:
	if Input.is_action_pressed("mouse_left"):
		global_position = get_global_mouse_position()
	

