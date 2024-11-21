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
var current_ghost: BasicCharacter

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
	
	##对话
	character.dialogue_list_before = ghost_data.dialogue_list_before
	character.dialogue_list_ask = ghost_data.dialogue_list_ask
	character.dialogue_list_after = ghost_data.dialogue_list_after
	
	##信息资料
	character.ghostname = ghost_data.ghostname
	character.country = ghost_data.country
	character.religion = ghost_data.religion
	character.death_reason = ghost_data.death_reason
	character.sex = ghost_data.sex
	character.applay = ghost_data.applay
	character.event = ghost_data.event
	
	##档案信息
	character.life_stories = ghost_data.life_stories
	character.people_evaluation = ghost_data.people_evaluation

	##资源
	character.animation_player.sprite_frames = ghost_data.sprite_frames
	
	##判断和通过影响
	character.is_can_pass = ghost_data.is_can_pass
	character.pass_influence = ghost_data.pass_influence
	character.refuse_influence = ghost_data.refuse_influence

##判断案件是否审判成功
func is_success(_current_case):
	if true: 
		DataServer.success_case += 1
	else :
		DataServer.failed_case += 1
