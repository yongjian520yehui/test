extends Node2D


func _ready() -> void:
	var units = get_tree().get_nodes_in_group("workers")
	connect_line(units[0],units[1])
	

func connect_line(father,child):
	var line_2d = Line2D.new()
	line_2d.add_point(father.global_position)
	line_2d.add_point(child.global_position)
	line_2d.name = str(father.name+"-"+child.name)
	line_2d.width = 2
	add_child(line_2d)
	line_2d.z_index = -1
