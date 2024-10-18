extends Node

func load_json_file(filePath):
	var content = load_file(filePath)
	var json=JSON.parse_string(content)
	return json

func save_game(content):
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	file.store_string(content)

func load_file(filePath):
	var file = FileAccess.open(filePath, FileAccess.READ)
	var content = file.get_as_text()
	return content

func ghost_factory():
	var ghost_data
	var contant = load_json_file("res://ghost_data/nomal_ghost.json")

	var ghost_name = contant["name"][randi_range(0,contant["name"].size()-1)]
	var country=contant["country"][randi_range(0,contant["country"].size()-1)]
	var religion=contant["religion"][randi_range(0,contant["religion"].size()-1)]
	var sex=contant["sex"]
	var intro=contant["intro"]
	var evaluation=contant["evaluation"]
	var reason=contant["reason"]
	var applay=contant["applay"]

	var formate_string = '{"day1":[{"baseInfo":{"name":"%s","country":"%s","religion":"%s","sex":1},"intro":"","evaluation":"","reason":"","applay":{"target":"","destination":""}}]}'
	var ghost_data_string = formate_string % [ghost_name,country,religion]
	#print(ghost_data_string)
	ghost_data = JSON.parse_string(ghost_data_string)
	return ghost_data
