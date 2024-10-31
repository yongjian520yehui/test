extends Node2D

@onready var selection_area = $"../SelectionArea"
@onready var collision_shape_2d = $"../SelectionArea/CollisionShape2D"

@export var select_area_color := Color(0, 1, 0, 0.05)

var selecttion_start_position := Vector2.ZERO


func _input(event: InputEvent) -> void:
	if (event is InputEventMouseButton and event.button_index ==1 
	and event.is_pressed() and selecttion_start_position == Vector2.ZERO):
		selecttion_start_position = get_global_mouse_position()
	elif (event is InputEventMouseButton and event.button_index == 1 
	and selecttion_start_position!=Vector2.ZERO):
		_select_units()
		selecttion_start_position = Vector2.ZERO
		
		

func _process(_delta: float) -> void:
	queue_redraw()

	
func _draw():
	if selecttion_start_position == Vector2.ZERO:
		return
	var startX : float
	var startY : float
	var endX : float
	var endY : float
	var mouse_position= get_global_mouse_position()
	startX= selecttion_start_position.x
	startY= selecttion_start_position.y
	endX= mouse_position.x
	endY= mouse_position.y
#
	draw_line(Vector2(startX,startY),Vector2(endX,startY),Color.WHITE,1)
	draw_line(Vector2(startX,startY),Vector2(startX,endY),Color.WHITE,1)
	draw_line(Vector2(startX,endY),Vector2(endX,endY),Color.WHITE,1)
	draw_line(Vector2(endX,startY),Vector2(endX,endY),Color.WHITE,1)
	
	#var area_pos = _get_rect_start_position()
	#var size = abs(get_global_mouse_position()-selecttion_start_position)
	##print("area_2d.global_position:",area_pos)
	##print("area_2d.size:",size)
	##area_2d.global_position = area_pos
	##collision_shape_2d.global_position = area_pos + size/2
	##collision_shape_2d.shape.size = size
	#draw_rect(Rect2(area_pos,size),Color(0, 1, 0, 0.05),true)
	
func _select_units():
	var size = abs(get_global_mouse_position() - selecttion_start_position)
	var area_pos = _get_rect_start_position()
	
	selection_area.global_position = area_pos
	collision_shape_2d.global_position = area_pos+size/2
	collision_shape_2d.shape.size = size
	print("area_2d.global_position:",area_pos)
	#print("area_2d.size:",size)
	
	print("collision_shape_2d.global_position:",collision_shape_2d.global_position)
	print("collision_shape_2d.size:",collision_shape_2d.shape.size)
	
	await  get_tree().create_timer(0.04).timeout
	var units = get_tree().get_nodes_in_group("workers")
	for i in units:
		print("-units-:",i.global_position)
		#print("-units-:",i)
	print(selection_area.get_overlapping_bodies())
	for body in selection_area.get_overlapping_bodies():
		if body in get_tree().get_nodes_in_group("workers"):
			body.is_selected = true
			units.erase(body)
		print(body)
	
	for body in units:
		body.is_selected = false

func _get_rect_start_position()-> Vector2:
	var new_pos : Vector2
	var mouse_pos = get_global_mouse_position()
	if selecttion_start_position.x < mouse_pos.x:
		new_pos.x = selecttion_start_position.x
	else :
		new_pos.x = mouse_pos.x
		
	if selecttion_start_position.y < mouse_pos.y:
		new_pos.y = selecttion_start_position.y
	else :
		new_pos.y = mouse_pos.y
	return new_pos
