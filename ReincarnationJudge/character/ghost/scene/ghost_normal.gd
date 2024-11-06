class_name GhostNormal
extends BasicCharacter

@onready var canvas_group: CanvasGroup = $CanvasGroup
@onready var outline_highlighter = $OutlineHighlighter

# 初始化角色，连接信号
func _ready() -> void:
	super()
	Utils.attack_ghost.connect(isHurt)

#被攻击状态修改
func isHurt():
	self.is_hurt = true

#鼠标进入角色时，高亮
func _on_mouse_entered() -> void:
	outline_highlighter.highlight()
	z_index = 1

#鼠标离开角色时，清除高亮
func _on_mouse_exited() -> void:
	outline_highlighter.clear_highlight()
	z_index = 0
