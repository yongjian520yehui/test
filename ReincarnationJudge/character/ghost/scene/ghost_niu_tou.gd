class_name GhostNiuTou
extends BasicCharacter

@onready var canvas_group: CanvasGroup = $CanvasGroup
@onready var outline_highlighter: OutlineHighlighter = $OutlineHighlighter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	Utils.attack_ghost.connect(isAttack)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#if is_selected:
		#outline_highlighter.highlight()
	#else:
		#outline_highlighter.clear_highlight()
		
func isAttack():
	self.is_attack = true


func _on_area_2d_mouse_entered():
	state_machine._on_area_2d_mouse_entered()

func _on_area_2d_mouse_exited():
	state_machine._on_area_2d_mouse_exited()


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	state_machine._on_area_2d_input_event(viewport, event, shape_idx)
