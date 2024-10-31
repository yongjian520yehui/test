class_name GhostWorker
extends BasicCharacter

@onready var canvas_group: CanvasGroup = $CanvasGroup
@onready var outline_highlighter: OutlineHighlighter = $OutlineHighlighter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	Utils.attack_ghost.connect(isAttack)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_selected:
		outline_highlighter.highlight()

func isAttack():
	self.is_attack = true

func _on_mouse_entered() -> void:
	if not is_selected:
		outline_highlighter.highlight()
		z_index = 1


func _on_mouse_exited() -> void:
	if not is_selected:
		outline_highlighter.clear_highlight()
		z_index = 0
