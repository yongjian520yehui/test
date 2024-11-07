extends Node2D

@onready var files_button = %FilesButton
@onready var ghost_book_button = %GhostBookButton
@onready var pause_menu: PauseMenu = %PauseMenu
@onready var book_ghost = %book_ghost
@onready var time_label: Label = %TimeLabel

const GHOST_NIU_TOU = preload(Utils.GHOST_NIU_TOU)
const GHOST_NORMAL = preload(Utils.GHOST_NORMAL)

@onready var animation_player: AnimationPlayer = %AnimationPlayer

@onready var judge_options: Control = $CanvasLayer/JudgeOptions
@onready var ghost_book_position: Control = $CanvasLayer/GhostBookPosition
@onready var niu_tou_positon = $NiuTouPositon
@onready var ghost_positon = $GhostPositon
@onready var ma_mian_positon = $MaMianPositon
@onready var black_positon = $BlackPositon
@onready var white_positon = $WhitePositon



func _ready() -> void:
	#加载员工
	var ghost_niutou = GHOST_NIU_TOU.instantiate()
	add_child(ghost_niutou)
	ghost_niutou.global_position = niu_tou_positon.global_position



func _process(_delta: float) -> void:
	pass

func get_Pos():
	return ghost_book_position.global_position

func _on_next_button_pressed() -> void:
	##添加ghost
	var ghosts = get_tree().get_nodes_in_group("ghosts")
	var workers = get_tree().get_nodes_in_group("workers")

	if ghosts.size() < 1:
		var ghost_normal = GHOST_NORMAL.instantiate()
		add_child(ghost_normal)
		ghost_normal.global_position=ghost_positon.global_position
	var ghosts1 = get_tree().get_nodes_in_group("ghosts")
	##添加ghostbook
	if ghost_book_button.visible == false:
		ghost_book_button.visible = true
		animation_player.play("ghost_book_get")

	##初始话对话控制器
	var dialogueControllerlist = get_tree().get_nodes_in_group("dialogueController")
	
	if dialogueControllerlist.size() == 0:
		var dialogueController = DialogueController.new()
		add_child(dialogueController)
		var dialogueList = DialogueList.new()
		dialogueController.dialogue_list = dialogueList
	
	DataServer.dialogue_start.emit(ghosts1[0],workers[0])

func _on_judge_button_pressed() -> void:
	if book_ghost.visible == false:
		ghost_book_button.visible = false
		judge_options.visible = true

func _on_ghost_book_button_pressed() -> void:
	if book_ghost.visible == false:
		book_ghost.visible = true
		book_ghost.open()

func _on_end_this_year_pressed() -> void:
	get_tree().change_scene_to_file(Utils.STATISTICS_SCENE)

func is_success(current_case):
	if true: 
		DataServer.success_case += 1
	else :
		DataServer.failed_case += 1
