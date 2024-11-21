extends PanelContainer

@onready var ask: MarginContainer = $Ask

var checklists


func _ready() -> void:
	%RightID.pressed.connect(_on_check_box_pressed.bind(%RightID))
	%FlaseID.pressed.connect(_on_check_box_pressed.bind(%FlaseID))
	%RightApplay.pressed.connect(_on_check_box_pressed.bind(%RightApplay))
	%FalseApplay.pressed.connect(_on_check_box_pressed.bind(%FalseApplay))
	%RightAppearance.pressed.connect(_on_check_box_pressed.bind(%RightAppearance))
	%FalseAppearance.pressed.connect(_on_check_box_pressed.bind(%FalseAppearance))
	%RightPassport.pressed.connect(_on_check_box_pressed.bind(%RightPassport))
	%FalsePassport.pressed.connect(_on_check_box_pressed.bind(%FalsePassport))
	checklists = get_tree().get_nodes_in_group("checklist")


func _process(delta: float) -> void:
	pass


func _on_ask_button_pressed() -> void:
	var ghosts : BasicCharacter = get_tree().get_nodes_in_group("ghosts")[0]
	var workers : BasicCharacter = get_tree().get_nodes_in_group("workers")[0]
	var check_list_name: Array
	for i: CheckBox in checklists:
		if i.button_pressed == true:
			check_list_name.append(i.name)
	print("check_list_name:",check_list_name)
	for j in check_list_name:
		print(j)
		if Utils.current_ghost.dialogue_list_ask.value[0].content == j:
			DataServer.get_dialogue_controller(self,workers,ghosts,Utils.current_ghost.dialogue_list_ask)
		else:
			var dialogue = Dialogue.new()
			dialogue.actor_id = 0 
			dialogue.content = j
			
			var commondialogue = ResourceLoader.load("res://character/dialogue/story01.tres")
			var dialogue_list = DialogueList.new()
			dialogue_list = commondialogue
			dialogue_list.value[0] = dialogue

			DataServer.get_dialogue_controller(self,workers,ghosts,dialogue_list)


func _on_close_button_pressed() -> void:
	hide()


func _on_check_box_pressed(box: CheckBox) -> void:
	match box.name:
		"RightID":
			%FlaseID.button_pressed = false
		"FlaseID":
			%RightID.button_pressed = false
		"RightApplay":
			%FalseApplay.button_pressed = false
		"FalseApplay":
			%RightApplay.button_pressed = false
		"RightAppearance":
			%FalseAppearance.button_pressed = false
		"FalseAppearance":
			%RightAppearance.button_pressed = false
		"RightPassport":
			%FalsePassport.button_pressed = false
		"FalsePassport":
			%RightPassport.button_pressed = false
		_:
			print("这个按钮没有匹配项，需要加入代码中。。。")
	_is_show_ask()


func _is_show_ask():
	for i: CheckBox in checklists:
		if i.button_pressed == true :
			ask.show()
			return
		else:
			ask.hide()
