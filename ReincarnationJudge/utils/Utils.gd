class_name Utils
extends Node


static func load_json_file(filePath):
	var content = load_file(filePath)
	var json=JSON.parse_string(content)
	return json

static func save_game(content):
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	file.store_string(content)

static func load_file(filePath):
	var file = FileAccess.open(filePath, FileAccess.READ)
	var content = file.get_as_text()
	return content
