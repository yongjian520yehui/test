class_name GhostNiuTou
extends BasicCharacter

@onready var canvas_group: CanvasGroup = $CanvasGroup
@onready var outline_highlighter: OutlineHighlighter = $OutlineHighlighter

# 初始化角色，连接信号
func _ready() -> void:
	super()
	Utils.attack_ghost.connect(isAttack)

#修改攻击状态
func isAttack():
	self.is_attack = true

#鼠标进入角色时
func _on_area_2d_mouse_entered():
	state_machine._on_area_2d_mouse_entered()
	
#鼠标离开角色时
func _on_area_2d_mouse_exited():
	state_machine._on_area_2d_mouse_exited()

#输入事件处理
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	state_machine._on_area_2d_input_event(viewport, event, shape_idx)
