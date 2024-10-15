extends CanvasLayer
@onready var pause_menu = $PauseMenu
@onready var main_menu = $MianMenu


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("eixt"):
		var tree := get_tree()
		tree.paused = not tree.paused
		#print(tree.paused)
		if tree.paused:
			#pause_menu.open()
			print("open")
			tree.paused=true
			print(tree.paused)
		else:
			#pause_menu.close()
			print("close")
			tree.paused=false
			print(tree.paused)

		get_tree().root.set_input_as_handled()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
