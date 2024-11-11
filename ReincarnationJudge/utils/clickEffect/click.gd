class_name Click extends Control

@onready var circle = $Circle
@onready var point = $Circle/Point

var workers
var contant

func _ready() -> void:
	workers = get_tree().get_nodes_in_group("workers")
	contant = Utils.load_json_file(Utils.NOMAL_GHOST)
	DataServer.get_ghost_data()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_pressed():
				var a = circle.duplicate()
				var b = point.duplicate()
				self.add_child(a)
				a.add_child(b)
				a.global_position = event.global_position
				a.emitting = true
				b.emitting = true
				a.connect("finished",_on_circle_finished.bind(a))

func _on_circle_finished(a):
	a.queue_free()


func _on_ask_pressed():
	var dialogueList = DataServer.get_dialogue_list(contant)
	DataServer.get_dialogue_controller(self,workers[0],workers[1],dialogueList)


func _on_next_pressed() -> void:
	var dialogueList = DataServer.get_dialogue_list(contant)
	DataServer.get_dialogue_controller(self,workers[0],workers[1],dialogueList)


func _on_judge_pressed() -> void:
	var dialogueList = DataServer.get_dialogue_list(contant)
	DataServer.get_dialogue_controller(self,workers[0],workers[1],dialogueList)
