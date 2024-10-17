extends Node2D


@onready var files: Button = $CanvasLayer/files
@onready var pause_menu: PauseMenu = %PauseMenu
@onready var book_ghost: Control = $CanvasLayer/book_ghost
@onready var animation_player: AnimationPlayer = %AnimationPlayer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	book_ghost.visible=true
	animation_player.play("files_get")
	pass
