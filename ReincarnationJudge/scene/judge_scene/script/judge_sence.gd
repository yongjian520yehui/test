extends Node2D

@onready var files_button = %FilesButton
@onready var ghost_book_button = %GhostBookButton
@onready var pause_menu: PauseMenu = %PauseMenu
@onready var book_ghost = %book_ghost
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var ghost_book_position = $CanvasLayer/GhostBookPosition
@onready var time_label: Label = %TimeLabel
@onready var judge_options: Control = $CanvasLayer/JudgeOptions

var success_case := 0
var failed_case := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func get_Pos():
	return ghost_book_position.global_position

func _on_next_button_pressed() -> void:
	if ghost_book_button.visible == false:
		ghost_book_button.visible = true
		animation_player.play("ghost_book_get")


func _on_judge_button_pressed() -> void:
	if book_ghost.visible == false:
		ghost_book_button.visible = false
		judge_options.visible = true


func _on_ghost_book_button_pressed() -> void:
	if book_ghost.visible == false:
		book_ghost.visible = true
		book_ghost.open()
	
func is_success():
	if true: success_case += 1


func _on_end_this_year_pressed() -> void:
	get_tree().change_scene_to_file(Utils.STATISTICS_PAGE)
