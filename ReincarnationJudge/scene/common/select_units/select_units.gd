extends Area2D

@onready var area_2d: Area2D = $"."
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@export var select_area_color := Color(0, 1, 0, 0.05)

var start_position := Vector2.ZERO


func _input(event: InputEvent) -> void:
	if (event is InputEventMouseButton and event.button_index ==1 
	and event.is_pressed() and start_position==Vector2.ZERO):
		start_position = get_global_mouse_position()
	elif (event is InputEventMouseButton and event.button_index ==1 and start_position!=Vector2.ZERO):
		start_position = Vector2.ZERO
		_select_units()
		

func _process(_delta: float) -> void:
	queue_redraw()
	#print("collision_shape_2d.global_position:",collision_shape_2d.global_position)
	#print("collision_shape_2d.size:",collision_shape_2d.shape.size)

	
func _draw():
	if start_position == Vector2.ZERO:
		return
	#var startX : float
	#var startY : float
	#var endX : float
	#var endY : float
	#end_position= get_global_mouse_position()
	#startX= start_position.x
	#startY= start_position.y
	#endX= end_position.x
	#endY= end_position.y	
#
	#draw_line(Vector2(startX,startY),Vector2(endX,startY),Color.WHITE,1)
	#draw_line(Vector2(startX,startY),Vector2(startX,endY),Color.WHITE,1)
	#draw_line(Vector2(startX,endY),Vector2(endX,endY),Color.WHITE,1)
	#draw_line(Vector2(endX,startY),Vector2(endX,endY),Color.WHITE,1)
	
	var area_pos = _get_rect_start_position()
	var size = abs(get_global_mouse_position()-start_position)
	#print("area_2d.global_position:",area_pos)
	#print("area_2d.size:",size)
	#area_2d.global_position = area_pos
	#collision_shape_2d.global_position = area_pos + size/2
	#collision_shape_2d.shape.size = size
	draw_rect(Rect2(area_pos,size),Color(0, 1, 0, 0.05),true)
	
func _select_units():
	var size = abs(get_global_mouse_position()-start_position)
	var area_pos = _get_rect_start_position()
	
	area_2d.global_position = area_pos
	collision_shape_2d.global_position = area_pos+size/2
	collision_shape_2d.shape.size = size
	
	await  get_tree().create_timer(0.04).timeout
	var units= get_tree().get_nodes_in_group("workers")
	print(area_2d.get_overlapping_bodies())
	for body in area_2d.get_overlapping_bodies():
		if body in get_tree().get_nodes_in_group("workers"):
			body.is_selected = true
			units.erase(body)
		print(body)
	
	for body in units:
		body.is_selected = false

func _get_rect_start_position()-> Vector2:
	var new_pos : Vector2
	var mouse_pos = get_global_mouse_position()
	if start_position.x < mouse_pos.x:
		new_pos.x = start_position.x
	else :
		new_pos.x = mouse_pos.x
		
	if start_position.y < mouse_pos.y:
		new_pos.y = start_position.y
	else :
		new_pos.y = mouse_pos.y
	return new_pos
