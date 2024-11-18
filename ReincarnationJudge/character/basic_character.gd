class_name BasicCharacter
extends CharacterBody2D

## 聊天位置组件
@export var bubble_marker: Node
## 状态组件
@export var stats: Stats
## 动画组件
@export var animation_player : AnimatedSprite2D
## 状态机组件
@export var state_machine: StateMachine


## 是否受伤
var is_hurt: bool = false
## 是否攻击
var is_attack: bool = false
## 是否为当前玩家扮演的角色
var is_player: bool = false
## 是否被选中
var is_selected: bool = false

func _ready() -> void:
	#开启状态机
	state_machine.start()
	

func isHurt():
	self.is_hurt = true
