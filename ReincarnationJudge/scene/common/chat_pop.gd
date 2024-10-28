extends Node2D
@onready var label: Label = $NinePatchRect/Label
@onready var nine_patch_rect: NinePatchRect = $NinePatchRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nine_patch_rect.size = label.size + Vector2.ONE*10
