extends Control

@onready var outline_highlighter: OutlineHighlighter = $OutlineHighlighter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	#if drag_and_drop.dragging:
		#return
	
	outline_highlighter.highlight()
	z_index = 1


func _on_mouse_exited() -> void:
	#if drag_and_drop.dragging:
		#return
	
	outline_highlighter.clear_highlight()
	z_index = 0
