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
const DIALOGUE := "res://character/ghost/data/dialogue.json"

signal attack_ghost

var missing_value = 100
var saved_money = 101
var cost = {"道具":1}
var salary = 102
var fine = 10
var year = 1
var screen_size : Vector2


func _ready() -> void:
	screen_size = DisplayServer.window_get_size()

func load_json_file(filePath: String)-> Dictionary:
	var content: String = load_file(filePath)
	var json: Dictionary = JSON.parse_string(content)
	return json


func load_file(filePath: String)-> String:
	var file: FileAccess = FileAccess.open(filePath, FileAccess.READ)
	var content: String = file.get_as_text()
	return content


func load_character_data(character:BasicCharacter, resource_path: String):
	var ghost_data = ResourceLoader.load(resource_path)
	character.dialogue_list_before = ghost_data.dialogue_list_before
	character.dialogue_list_ask = ghost_data.dialogue_list_ask
	character.dialogue_list_after = ghost_data.dialogue_list_after
	character.book = ghost_data.book
	character.animation_player.sprite_frames = ghost_data.sprite_frames

##判断案件是否审判成功
func is_success(_current_case):
	if true: 
		DataServer.success_case += 1
	else :
		DataServer.failed_case += 1
