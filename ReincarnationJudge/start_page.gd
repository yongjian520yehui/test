extends CanvasLayer
@onready var label = $Label
@onready var pause_menu = $CanvasLayer/PauseMenu
@onready var main_menu = $MianMenu

var test : = false
func _ready():
	var tree := get_tree()
	if tree.paused==true:
		label.text="pause"
	else:
		label.text="not pause"
		
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"exit"):
		print("get INput")
		var tree := get_tree()
		print(tree.paused)
		tree.paused = not tree.paused
		if tree.paused==true:
			label.text="pause"
		else:
			label.text="not pause"
			
		if tree.paused:
			pause_menu.open()
			#print(tree.paused)
		else:
			pause_menu.close()

		get_tree().root.set_input_as_handled()
		
		#test = not test
		#if test:
			#pause_menu.open()
		#else:
			#pause_menu.close()
		#get_tree().root.set_input_as_handled()

