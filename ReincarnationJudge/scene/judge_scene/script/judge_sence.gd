extends Node2D

##按钮

##场景预加载
const GHOST_NIU_TOU = preload(Utils.GHOST_NIU_TOU)
const GHOST_NORMAL = preload(Utils.GHOST_NORMAL)

##位置节点
@onready var judge_options: Control = $CanvasLayer/JudgeOptions
@onready var ghost_book_position: Control = $CanvasLayer/GhostBookPosition
@onready var niu_tou_positon = $NiuTouPositon
@onready var ghost_positon = $GhostPositon
@onready var ma_mian_positon = $MaMianPositon
@onready var black_positon = $BlackPositon
@onready var white_positon = $WhitePositon




func _ready() -> void:
	##加载员工，后续从存档中获取
	#DataServer.load_game()
	var ghost_niutou = GHOST_NIU_TOU.instantiate()
	add_child(ghost_niutou)
	ghost_niutou.global_position = niu_tou_positon.global_position
	%JudgeButton.disabled = true

func _process(_delta: float) -> void:
	pass


func _on_next_button_pressed() -> void:

	##如果没有ghost，则添加
	if get_tree().get_nodes_in_group("ghosts").size() < 1:
		var ghost_normal = GHOST_NORMAL.instantiate()
		add_child(ghost_normal)
		ghost_normal.global_position = ghost_positon.global_position
		#get_tree().create_tween().tween_property(ghost_normal,^"modulate:a",1.0,1).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	
	##获取目前所有ghost
	var ghosts1 = get_tree().get_nodes_in_group("ghosts")
	var workers = get_tree().get_nodes_in_group("workers")
	
	##显示book
	if %GhostBookButton.visible == false:
		%GhostBookButton.show()
		%AnimationPlayer.play("ghost_book_get")
	
	##获取对话数据
	var ghost_data = DataServer.get_ghost_data()
	var dialogue_list = ghost_data["dialogue_list"]
	##创建对话节点
	DataServer.get_dialogue_controller(self,ghosts1[0],workers[0],dialogue_list)
	
	##禁用启用button
	%JudgeButton.disabled = false
	%NextButton.disabled = true

##审判按钮点击事件
func _on_judge_button_pressed() -> void:
	
	%JudgeButton.disabled = true
	##显示审判页面,隐藏book，显示option
	if %GhostBook.visible == false:
		%GhostBookButton.disabled = true
		judge_options.show()

##book按钮点击事件
func _on_ghost_book_button_pressed() -> void:
	##显示book详细内容
	if %GhostBook.visible == false:
		%GhostBook.show()
		%GhostBook.open()

##结束这一年按钮，跳转统计页面
func _on_end_this_year_pressed() -> void:
	get_tree().change_scene_to_file(Utils.STATISTICS_SCENE)

##判断案件是否审判成功
func is_success(_current_case):
	if true: 
		DataServer.success_case += 1
	else :
		DataServer.failed_case += 1
