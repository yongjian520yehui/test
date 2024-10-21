extends Node2D

@onready var files_button: Button = $CanvasLayer/FilesButton
@onready var ghost_book_button: Button = $CanvasLayer/GhostBookButton
@onready var pause_menu: PauseMenu = %PauseMenu
@onready var book_ghost: Control = $CanvasLayer/book_ghost
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var death_god: Sprite2D = $DeathGod
@onready var animation_player_2: AnimationPlayer = %AnimationPlayer2
@onready var death_god_2: Sprite2D = $DeathGod2




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("death_god_idle")




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_next_button_pressed() -> void:
	if ghost_book_button.visible== false:
		ghost_book_button.visible=true
		animation_player.play("ghost_book_get")
		animation_player_2.play("death_god2_dismiss")
		await animation_player_2.animation_finished
		death_god_2.visible=false


func _on_judge_button_pressed() -> void:
	if book_ghost.visible== false:
		ghost_book_button.visible= false


func _on_ghost_book_button_pressed() -> void:
	if book_ghost.visible== false:
		book_ghost.visible=true
		book_ghost.open()

