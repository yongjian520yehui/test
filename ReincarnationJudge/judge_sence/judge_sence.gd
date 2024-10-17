extends Node2D


@onready var files: Button = $files
@onready var pause_menu: PauseMenu = $CanvasLayer/PauseMenu
@onready var book_ghost: Control = $CanvasLayer/book_ghost



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	book_ghost.visible=true
	pass
