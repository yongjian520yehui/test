extends Node2D

@onready var files_button = %FilesButton
@onready var ghost_book_button = %GhostBookButton
@onready var pause_menu: PauseMenu = %PauseMenu
@onready var book_ghost = %book_ghost
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var time_label: Label = %TimeLabel
@onready var judge_options: Control = $CanvasLayer/JudgeOptions
@onready var dialogue_controler: DialogueController = $dialogueControler
@onready var ghost_book_position: Control = $CanvasLayer/GhostBookPosition



var success_case := 0
var failed_case := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialogue_controler.start()
	#for woker in get_tree().get_nodes_in_group("workers"):
		#print(woker.name)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func get_Pos():
	return ghost_book_position.global_position

func _on_next_button_pressed() -> void:
	if ghost_book_button.visible == false:
		ghost_book_button.visible = true
		animation_player.play("ghost_book_get")
		var ghost = get_tree().get_nodes_in_group("ghosts")
		for i in ghost:
			i.visible = true
		#var tween = create_tween()
		#ghost_book_button.scale = Vector2(2,2)
		#tween.tween_property(ghost_book_button,"position",ghost_book_position.global_position,0.5).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
		#tween.set_parallel().tween_property(ghost_book_button,"scale",Vector2.ONE,0.5).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
		#tween.set_parallel().tween_property(ghost_book_button,"rotation",360.0,0.5).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	Utils.attack_ghost.emit()
	DataServer.dialogue_start.emit()


func _on_judge_button_pressed() -> void:
	if book_ghost.visible == false:
		ghost_book_button.visible = false
		judge_options.visible = true
		var ghost = get_tree().get_nodes_in_group("ghosts")
		for i in ghost:
			i.visible = false


func _on_ghost_book_button_pressed() -> void:
	if book_ghost.visible == false:
		book_ghost.visible = true
		book_ghost.open()

func is_success():
	if true: success_case += 1


func _on_end_this_year_pressed() -> void:
	get_tree().change_scene_to_file(Utils.STATISTICS_SCENE)
