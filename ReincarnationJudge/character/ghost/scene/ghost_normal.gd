class_name GhostNormal
extends BasicCharacter

@onready var canvas_group: CanvasGroup = $CanvasGroup
@onready var outline_highlighter = $OutlineHighlighter

@export var dialogue_list_before: DialogueList
@export var dialogue_list_ask: DialogueList
@export var dialogue_list_after: DialogueList
@export var book: Dictionary
@export var event: BaseEvent
@export var evidence: BasicCharacter

# 初始化角色，连接信号
func _ready() -> void:
	super()
	
	Utils.load_character_data(self, "res://character/ghost/data/famous_people/bad/ghost_yangli.tres")
	
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
