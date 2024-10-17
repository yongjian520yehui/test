extends Node2D
@onready var book_ghost: Node2D = $BookGhost
@onready var files: Button = $files
@onready var pause_menu: PauseMenu = $CanvasLayer/PauseMenu



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	book_ghost.visible=true
