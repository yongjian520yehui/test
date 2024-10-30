extends Node

var missing_value = 100
var saved_money = 101
var cost = {"道具":1}
var salary = 102
var fine = 10
var year = 1

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
	var ghost_data
	var contant = Utils.load_json_file(Utils.NOMAL_GHOST)

	var ghost_name = contant["name"][randi_range(0,contant["name"].size()-1)]
	var country = contant["country"][randi_range(0,contant["country"].size()-1)]
	var religion = contant["religion"][randi_range(0,contant["religion"].size()-1)]
	var sex = contant["sex"]
	var intro = contant["intro"]
	var evaluation = contant["evaluation"]
	var reason = contant["reason"]
	var applay = contant["applay"]

	var formate_string = '{"day1":[{"baseInfo":{"name":"%s","country":"%s","religion":"%s","sex":1},"intro":"","evaluation":"","reason":"","applay":{"target":"","destination":""}}]}'
	var ghost_data_string = formate_string % [ghost_name,country,religion]
	#print(ghost_data_string)
	ghost_data = JSON.parse_string(ghost_data_string)
	return ghost_data
