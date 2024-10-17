extends CanvasLayer

@onready var pause_menu: PauseMenu = %PauseMenu


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"exit"):
		var tree := get_tree()
		tree.paused = not tree.paused
		if tree.paused:
			pause_menu.open()
			#print(tree.paused)
		else:
			pause_menu.close()

		get_tree().root.set_input_as_handled()
