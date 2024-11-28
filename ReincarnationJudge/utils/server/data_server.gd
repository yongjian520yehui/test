extends Node

##主角资源数据
var missing_value := 100
var saved_money := 101
var cost := {"道具":1}
var salary := 102
var fine := 10
##已经经过的年数
var year := 1
##每年成功和失败案例
var success_case := 0
var failed_case := 0
##出现概率
var country_rate := 0.7
var religion_rate := 0.5

# 定义初始日期  
var current_date := {  
	"year": 2023,  
	"month": 1,  
	"day": 1,  
	"hour": 0,  
	"minute": 0,  
	"second": 0  
}  

##存储路径
var directory_path := "user://save/"  
var file_path_string := "user://save/%s.dat" 
var auto_save_file_path := "user://save/autoSave.dat" 

##ghost格式化字符串
var baseInfo_string := '{"name":"%s","country":"%s","religion":"%s","sex":"%s"}'

##对话开始信号
signal dialogue_started()

var all_dialogue_data: Dictionary

var current_ghost: GhostNormal

const GHOST_NORMAL = preload("res://character/ghost/scene/ghost_normal.tscn")


func _ready() -> void:
	#all_dialogue_data = Utils.load_json_file(Utils.DIALOGUE)
	pass

##存储游戏
func save_game(filepath: String):
	var gameData := {"years":DataServer.current_date["year"],"saved_money":Utils.saved_money}

	# 获取目录下的文件和文件夹列表
	if not DirAccess.dir_exists_absolute(directory_path):
		DirAccess.make_dir_absolute(directory_path)
 	
	var saveDir: DirAccess = DirAccess.open(directory_path)
	var saveFilesArray: PackedStringArray = saveDir.get_files()

	var file: FileAccess = FileAccess.open(filepath, FileAccess.WRITE)
	file.store_string(str(gameData))

##加载游戏
func load_game(filepath: String):
	if filepath:
		var file = FileAccess.open(filepath, FileAccess.READ)
		if file:
			var content = file.get_as_text()
			var gameDataJson = JSON.parse_string(content)
			DataServer.current_date["year"] = gameDataJson["years"]
			Utils.saved_money = gameDataJson["saved_money"]
	return


##获取对话列表
func get_dialogue_list(type: String ,contant: String)-> DialogueList:
	##获取数据
	#print(all_dialogue_data[type][contant])
	var dialogue_data: Array = all_dialogue_data[type][contant]
	
	var dialogue_array : Array[Dialogue]
	var dialogue_list : DialogueList = DialogueList.new()
	
	for i: Dictionary in dialogue_data:
		var dialogue: Dialogue = Dialogue.new()
		dialogue.actor_id = i.values()[0]
		dialogue.content = i.keys()[0]
		dialogue_array.append(dialogue)

	dialogue_list.value = dialogue_array
	
	return dialogue_list


##获取对话控制器
func get_dialogue_controller(node: Node,character1: BasicCharacter,
	character2: BasicCharacter,dialogue_list: DialogueList):
	##初始对话控制器
	var bubble: Array[Node] = get_tree().get_nodes_in_group("bubble")
	if not bubble:
		##对话控制器，则添加到场景
		var dialogueController: DialogueController = DialogueController.new()
		node.add_child(dialogueController)
		dialogueController.add_to_group("dialogueController")
		##初始化对话列表
		var dialogueList: DialogueList = DialogueList.new()
		dialogueController.dialogue_list = dialogueList

		##发送对话开始信号，dialogueControler.gd连接此信号
		DataServer.dialogue_started.emit(character1,character2,dialogue_list)


func get_ghost_data(filepath: String):
	var ghost_resource = ResourceLoader.load("res://character/ghost/data/ghost_希特勒.tres")
	var ghost = GHOST_NORMAL.instantiate()
	ghost.ghost_data = ghost_resource
	self.current_ghost = ghost


#func load_character_data(character:BasicCharacter, ghost_data: GhostResource):
	#
	###对话
	#character.dialogue_list_before = ghost_data.dialogue_list_before
	#character.dialogue_list_ask = ghost_data.dialogue_list_ask
	#character.dialogue_list_after = ghost_data.dialogue_list_after
	#
	###信息资料
	#character.ghostname = ghost_data.ghostname
	#character.country = ghost_data.country
	#character.religion = ghost_data.religion
	#character.death_reason = ghost_data.death_reason
	#character.sex = ghost_data.sex
	#character.applay = ghost_data.applay
	#character.event = ghost_data.event
	#
	###档案信息
	#character.life_stories = ghost_data.life_stories
	#character.people_evaluation = ghost_data.people_evaluation
#
	###资源
	#character.animation_player.sprite_frames = ghost_data.sprite_frames
	#
	###判断和通过影响
	#character.is_can_pass = ghost_data.is_can_pass
	#character.pass_influence = ghost_data.pass_influence
	#character.refuse_influence = ghost_data.refuse_influence

###获取ghost所有数据
#func get_ghost_data() -> Dictionary:
	###获取ghost数据，book数据和对话数据
	#var ghost_data : Dictionary
	#var contant: Dictionary = Utils.load_json_file(Utils.NOMAL_GHOST)
	###基础信息
	#var baseInfo = get_basic_info(contant)
	#ghost_data["baseInfo"] = baseInfo
	###生平介绍
	##var intro = contant["intro"]
	###评价
	#var evaluation: String = contant["evaluation"][randi_range(0,contant["evaluation"].size()-1)]
	###死亡原因
	#var reason: String = contant["reason"]["他杀"][randi_range(0,contant["reason"]["他杀"].size()-1)]
	#
	###申请表
	##var applay = contant["applay"]
	#
	#ghost_data["deathReason"] = baseInfo
	#
	##print(ghost_data)
	#return ghost_data

##获取ghost基础信息
#func get_basic_info(contant: Dictionary)-> Dictionary:
	#var country: String = contant["country"][randi_range(0,contant["country"].size()-1)]
	#var religion: String = contant["religion"][randi_range(0,contant["religion"].size()-1)]
	#var sex: String = contant["sex"][randi_range(0,contant["sex"].size()-1)]
	#var ghost_name: String = get_ghost_name(sex,country,contant)
	#var baseInfo: Dictionary = JSON.parse_string(baseInfo_string % [ghost_name,country,religion,sex])
	#return baseInfo


##获取ghost名字
#func get_ghost_name(sex: String,country: String, contant: Dictionary)-> String:
	#var ghost_name: String
	#var ghost_first_name: String
	#var ghost_last_name: String
	#if country == "中国":
		#ghost_last_name = contant["姓"][randi_range(0,contant["姓"].size()-1)]
		#if sex == "男":
			#ghost_first_name = contant["男名"][randi_range(0,contant["男名"].size()-1)]
		#else:
			#ghost_first_name = contant["女名"][randi_range(0,contant["女名"].size()-1)]
		#ghost_name = ghost_last_name + ghost_first_name
	#else:
		#ghost_last_name = contant["lastName"][randi_range(0,contant["lastName"].size()-1)]
		#if sex == "男":
			#ghost_first_name = contant["maleFirstName"][randi_range(0,contant["maleFirstName"].size()-1)]
		#else:
			#ghost_first_name = contant["femaleFirstName"][randi_range(0,contant["femaleFirstName"].size()-1)]
		#ghost_name = ghost_first_name+"."+ghost_last_name
	#return ghost_name
