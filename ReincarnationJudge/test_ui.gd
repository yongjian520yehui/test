extends CanvasLayer

var workers
var ghosts
const REQUEST_EVENT = preload("res://utils/event/request_event.tscn")
@onready var event_position: Control = $EventPosition


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var screen_size = DisplayServer.window_get_size()
	workers = get_tree().get_nodes_in_group("workers")
	workers[0].global_position = Vector2(screen_size.x/2, screen_size.y*0.67)
	ghosts = get_tree().get_nodes_in_group("ghosts")
	ghosts[0].global_position = Vector2(screen_size.x/2, screen_size.y*0.33)
	

func _on_ask_pressed():
	#var dialogueList = DataServer.get_dialogue_list("question","姓名有问题无别名")
	var dialogueList = ResourceLoader.load("res://character/dialogue/story01.tres")
	DataServer.get_dialogue_controller(self,workers[0],ghosts[0],dialogueList)
	

func _on_next_pressed() -> void:
	var dialogueList = DataServer.get_dialogue_list("beforeJudge","这是哪里")
	DataServer.get_dialogue_controller(self,workers[0],ghosts[0],dialogueList)
	
		
	
func _on_judge_pressed() -> void:
	var dialogueList = DataServer.get_dialogue_list("afterJudge","加油")
	DataServer.get_dialogue_controller(self,workers[0],ghosts[0],dialogueList)


func _on_event_pressed() -> void:
	EventServer.event_started.emit(self, event_position, "news")


func _on_button_pressed() -> void:
	var fatty_shader = ResourceLoader.load("res://shader/fatty_shader.tres")
	$"../GhostNormal".animation_player.material = fatty_shader
