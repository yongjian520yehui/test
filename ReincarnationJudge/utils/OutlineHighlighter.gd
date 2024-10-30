class_name OutlineHighlighter
extends Node

@export var visuals: Node
@export var outline_color: Color
@export_range(0, 10) var outline_thickness: int


func _ready() -> void:
	visuals.material.set_shader_parameter("line_color", outline_color)


func clear_highlight() -> void:
	print("clear_highlight")
	visuals.material.set_shader_parameter("line_thickness", 0)


func highlight() -> void:
	print("highlight")
	visuals.material.set_shader_parameter("line_thickness", outline_thickness)
