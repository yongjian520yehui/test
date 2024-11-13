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
	EventServer.event_started.connect(event)


func _on_ask_pressed():
	#var dialogueList = DataServer.get_dialogue_list("question","姓名有问题无别名")
	var dialogueList = ResourceLoader.load("res://character/dialogue/story01.tres")
	DataServer.get_dialogue_controller(self,workers[0],ghosts[0],dialogueList)
	EventServer.event_started.emit()

func _on_next_pressed() -> void:
	var dialogueList = DataServer.get_dialogue_list("beforeJudge","这是哪里")
	DataServer.get_dialogue_controller(self,workers[0],ghosts[0],dialogueList)
	
func event():
	var events = get_tree().get_nodes_in_group("events")

	if events.size() == 0 :
		var event = EventServer.get_event_data("request")
		print(event)
		add_child(event)
		event.global_position = event_position.global_position
		get_tree().create_tween().tween_property(event,"position:x",event.global_position.x - event.size.x,0.5).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	else:
		var event = EventServer.get_event_data("request")
		add_child(event)
		event.global_position = event_position.global_position
		for i in events:
			get_tree().create_tween().tween_property(i,"position:y",i.global_position.y - event.size.y,0.5).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
		get_tree().create_tween().tween_property(event,"position:x",event.global_position.x - event.size.x,0.5).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	
	if events.size() > 3:
		var tween = get_tree().create_tween()
		tween.tween_property(events[0],^"modulate:a",0,0.5).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
		await tween.finished
		events[0].queue_free()
		
	
func _on_judge_pressed() -> void:
	var dialogueList = DataServer.get_dialogue_list("afterJudge","加油")
	DataServer.get_dialogue_controller(self,workers[0],ghosts[0],dialogueList)
