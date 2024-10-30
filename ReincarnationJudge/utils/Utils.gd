extends Node

#角色路径
const GHOST := "res://character/ghost/scene/ghost.tscn"
const GHOST_WORKER := "res://character/ghost/scene/ghost_worker.tscn"
#工具路径
const TIME_SYSTEM := "res://utils/time_system.tscn"
#场景文件路径
const CHAT_POP := "res://scene/common/chat_pop.tscn"
const PAUSE_MENU := "res://scene/menu/scene/pause_menu.tscn"
const MAIN_MENU := "res://scene/menu/scene/mainMenu.tscn"
const BOOK_GHOST := "res://scene/judge_scene/scene/book_ghost.tscn"
const FILES :="res://scene/judge_scene/scene/files.tscn"
const JUDGE_OPTIONS := "res://scene/judge_scene/scene/judge_options.tscn"
const JUDGE_SENCE := "res://scene/judge_scene/scene/judge_sence.tscn"
const STATISTICS_SCENE := "res://scene/statistics_scene/scene/statisticsPage.tscn"
#数据文件路径
const NOMAL_GHOST := "res://character/ghost/data/nomal_ghost.json"
const IMPORTANT_GHOST := "res://character/ghost/data/important_ghost.json"


var missing_value = 100
var saved_money = 101
var cost = {"道具":1}
var salary = 102
var fine = 10
var year = 1

func load_json_file(filePath):
	var content = load_file(filePath)
	var json = JSON.parse_string(content)
	return json

func save_game(content):
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	file.store_string(content)

func load_game():
	var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
	var content = file.get_as_text()
	var gameDataJson = JSON.parse_string(content)
	Utils.year = gameDataJson["years"]
	Utils.saved_money = gameDataJson["saved_money"]


func load_file(filePath):
	var file = FileAccess.open(filePath, FileAccess.READ)
	var content = file.get_as_text()
	return content

func ghost_factory():
	var ghost_data
	var contant = load_json_file(Utils.NOMAL_GHOST)

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
