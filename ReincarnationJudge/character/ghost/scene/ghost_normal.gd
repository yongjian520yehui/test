class_name GhostNormal
extends BasicCharacter

@onready var canvas_group: CanvasGroup = $CanvasGroup
@onready var outline_highlighter = $OutlineHighlighter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	Utils.attack_ghost.connect(isHurt)

func isHurt():
	self.is_hurt = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	#if drag_and_drop.dragging:
		#return
	print("enter")
	outline_highlighter.highlight()
	z_index = 1


func _on_mouse_exited() -> void:
	#if drag_and_drop.dragging:
		#return
	print("_on_mouse_exited")
	outline_highlighter.clear_highlight()
	z_index = 0
