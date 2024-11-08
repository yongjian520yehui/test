extends Node

#角色路径
const GHOST_NORMAL := "res://character/ghost/scene/ghost_normal.tscn"
const GHOST_NIU_TOU := "res://character/ghost/scene/ghost_niu_tou.tscn"
#工具路径

#场景文件路径
const PAUSE_MENU := "res://scene/menu/scene/pause_menu.tscn"
const MAIN_MENU := "res://scene/menu/scene/mainMenu.tscn"
const BOOK_GHOST := "res://scene/judge_scene/scene/book_ghost.tscn"
const FILES :="res://scene/judge_scene/scene/files.tscn"
const JUDGE_OPTIONS := "res://scene/judge_scene/scene/judge_options.tscn"
const JUDGE_SENCE := "res://scene/judge_scene/scene/judge_sence.tscn"
const STATISTICS_SCENE := "res://scene/statistics_scene/scene/statistics_scene.tscn"
#数据文件路径
const NOMAL_GHOST := "res://character/ghost/data/nomal_ghost.json"
const IMPORTANT_GHOST := "res://character/ghost/data/important_ghost.json"

signal attack_ghost

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
