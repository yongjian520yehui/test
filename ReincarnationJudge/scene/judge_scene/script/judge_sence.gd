extends Node2D

##场景预加载
const GHOST_NIU_TOU = preload(Utils.GHOST_NIU_TOU)
const GHOST_NORMAL = preload(Utils.GHOST_NORMAL)


var ghost: GhostNormal 


func _ready() -> void:
	##加载员工，后续从存档中获取
	#DataServer.load_game()
	var ghost_niutou: GhostNiuTou = GHOST_NIU_TOU.instantiate()
	add_child(ghost_niutou)
	ghost_niutou.global_position = %NiuTouPositon.global_position
	
	%GhostPositon.global_position = Vector2(Utils.screen_size.x/2, Utils.screen_size.y*0.33)
	%SelfPosition.global_position = Vector2(Utils.screen_size.x/2, Utils.screen_size.y*0.67)
	
	%JudgeButton.disabled = true
	##连接审判按钮确定信号
	%JudgeOptions.judged.connect(after_judge)
	##事件推出节点
	EventServer.push_node = $CanvasLayer
	EventServer.push_node_positon = %EventPosition



##审判结束
func after_judge():
	##获取目前所有ghost
	var ghosts : BasicCharacter = get_tree().get_nodes_in_group("ghosts")[0]
	var workers : BasicCharacter = get_tree().get_nodes_in_group("workers")[0]
	
	##对话
	DataServer.get_dialogue_controller(self,workers,ghosts,ghost.dialogue_list_after)
	var dialogueController = get_tree().get_nodes_in_group("dialogueController")
	await dialogueController[0].finished
	##ghost退出动画
	ghosts.animation_player.play("out")
	await ghosts.animation_player.animation_finished
	ghosts.queue_free()
	##触发事件
	EventServer.push_evnet("news")


func _on_next_button_pressed() -> void:
	##如果没有ghost，则添加
	if get_tree().get_nodes_in_group("ghosts").size() < 1:
		ghost = GHOST_NORMAL.instantiate()
		add_child(ghost)
		ghost.global_position = %GhostPositon.global_position
	
	##获取目前所有ghost
	var ghosts : BasicCharacter = get_tree().get_nodes_in_group("ghosts")[0]
	var workers : BasicCharacter = get_tree().get_nodes_in_group("workers")[0]
	
	##显示book
	if %BookButton.visible == false:
		%BookButton.show()
		%FilesButton.show()
		#%AnimationPlayer.play("ghost_book_get")
	
	##等待ghost进入动画改变成idle，然后开启对话
	await ghost.animation_player.animation_changed
	
	##创建对话节点
	DataServer.get_dialogue_controller(self,workers,ghosts,ghost.dialogue_list_before)
	var dialogueController = get_tree().get_nodes_in_group("dialogueController")
	
	##nextbutton禁用
	%NextButton.disabled = true
	
	await dialogueController[0].finished
	##等待对话结束开启judgebutton
	%JudgeButton.disabled = false


##审判按钮点击事件
func _on_judge_button_pressed() -> void:
	%JudgeButton.disabled = true
	##显示审判页面,隐藏book，显示option
	%GhostBookButton.disabled = true
	%JudgeOptions.show()


##book按钮点击事件
func _on_ghost_book_button_pressed() -> void:
	##显示book详细内容
	%BookGhost.visible = not %BookGhost.visible
	if ghost and %GhostBook.visible:
		%BookGhost.show()
	else:
		%BookGhost.hide()


##结束这一年按钮，跳转统计页面
func _on_end_this_year_pressed() -> void:
	get_tree().change_scene_to_file(Utils.STATISTICS_SCENE)


func _on_ask_button_pressed() -> void:
	%AskTree.show()


func _on_ask_tree_item_selected() -> void:
	%AskTree.hide()
	
	var treeItemText = %AskTree.get_selected().get_text(%AskTree.get_selected_column())
	var ghosts : BasicCharacter = get_tree().get_nodes_in_group("ghosts")[0]
	var workers : BasicCharacter = get_tree().get_nodes_in_group("workers")[0]
	
	if ghost.dialogue_list_ask.value[0].content == treeItemText:
		DataServer.get_dialogue_controller(self,workers,ghosts,ghost.dialogue_list_ask)
	else:
		var dialogue = Dialogue.new()
		dialogue.actor_id = 0 
		dialogue.content = treeItemText
		
		var commondialogue = ResourceLoader.load("res://character/dialogue/story01.tres")
		var dialogue_list = DialogueList.new()
		dialogue_list = commondialogue
		dialogue_list.value[0] = dialogue

		DataServer.get_dialogue_controller(self,workers,ghosts,dialogue_list)
