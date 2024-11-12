class_name DialogueController
extends Node

const BUBBLE : PackedScene = preload("res://character/dialogue/Bubble.tscn")
@export var dialogue_list: DialogueList
@export var actor_list: Array[BasicCharacter]

signal finished()

var _index: int = -1
var _count: int
var _list: Array[Dialogue]
var _started: bool = false


func _ready() -> void:
	##连接对话开始信号
	DataServer.dialogue_started.connect(start)

func _physics_process(_delta: float) -> void:
	if _started:
		if Input.is_action_just_pressed("mouse_left"):
			if not next() :
				end()


func next() -> bool:
	for character: BasicCharacter in actor_list:
		if character.bubble_marker.get_child_count() > 0:
			character.bubble_marker.get_child(0).queue_free()
	
	## 判断当前对话索引是不是已经到最大对话数
	_index += 1
	if _index >= _count:
		return false
	## 还有对话，则生成对话
	var dialogue: Dialogue = _list[_index]
	var character: BasicCharacter = actor_list[dialogue.actor_id]
	var bubble: Bubble = BUBBLE.instantiate()
	bubble.text = dialogue.content
	character.bubble_marker.add_child(bubble)
	return true

func start(character1: BasicCharacter,character2: BasicCharacter,dialogue_list1: DialogueList):
	print(name, " 对话开始")
	##获取对话数据
	#var ghost_data = DataServer.ghost_factory()
	#dialogue_list.value = ghost_data["dialogue_list"]
	dialogue_list = dialogue_list1
	
	actor_list.append(character1)
	actor_list.append(character2)
	
	_count = dialogue_list.value.size()
	_list = dialogue_list.value
	
	next()
	_started = true


func end():
	print(name, " 对话结束")
	_started = false
	_index = -1
	finished.emit()
	queue_free()
