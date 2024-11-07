extends Node

var missing_value = 100
var saved_money = 101
var cost = {"道具":1}
var salary = 102
var fine = 10
var year = 1
var success_case := 0
var failed_case := 0

signal dialogue_start()

func _ready() -> void:
	ghost_factory()

func save_game(content):
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	file.store_string(content)

func load_game():
	var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
	var content = file.get_as_text()
	var gameDataJson = JSON.parse_string(content)
	Utils.year = gameDataJson["years"]
	Utils.saved_money = gameDataJson["saved_money"]
	
func ghost_factory():
	var ghost_data : Dictionary
	var contant = Utils.load_json_file(Utils.NOMAL_GHOST)

	var ghost_name = contant["name"][randi_range(0,contant["name"].size()-1)]
	var country = contant["country"][randi_range(0,contant["country"].size()-1)]
	var religion = contant["religion"][randi_range(0,contant["religion"].size()-1)]
	var sex = contant["sex"][randi_range(0,contant["sex"].size()-1)]
	#var intro = contant["intro"]
	#var evaluation = contant["evaluation"]
	#var reason = contant["reason"]
	#var applay = contant["applay"]

	var dialogue_list = dialogue_factory(contant)
	
	var baseInfo_string = '{"name":"%s","country":"%s","religion":"%s","sex":"%s"}' % [ghost_name,country,religion,sex]
	var baseInfo = JSON.parse_string(baseInfo_string)
	ghost_data["baseInfo"] = baseInfo
	ghost_data["dialogue_list"] = dialogue_list
	#print(ghost_data)
	return ghost_data

func dialogue_factory(contant):
	
	var ghost_dialogue_list = contant["ghost_dialogue"]
	var self_dialogue_list = contant["self_dialogue"]
	var dialogue_list : Array[Dialogue]
	var ghost_dialogue = Dialogue.new()
	ghost_dialogue.actor_id = 0
	ghost_dialogue.content = ghost_dialogue_list["first"][randi_range(0,ghost_dialogue_list["first"].size()-1)]
	dialogue_list.append(ghost_dialogue)
	var self_dialogue = Dialogue.new()
	self_dialogue.actor_id = 1
	self_dialogue.content = self_dialogue_list["first"][randi_range(0,self_dialogue_list["first"].size()-1)]
	dialogue_list.append(self_dialogue)

	return dialogue_list
