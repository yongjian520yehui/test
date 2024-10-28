extends Node2D
@onready var label: Label = $NinePatchRect/Label
@onready var nine_patch_rect: NinePatchRect = $NinePatchRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	nine_patch_rect.size = label.size


func _on_label_minimum_size_changed() -> void:
	nine_patch_rect.size = label.size
