class_name DragAndDrop
extends Node

signal drag_canceled(starting_position: Vector2)
signal drag_started
signal dropped(starting_position: Vector2)

@export var enabled: bool = true
@export var drag_area: Control
@export var target: Control

var starting_position: Vector2
var offset := Vector2.ZERO
var dragging := false


func _ready() -> void:
	if drag_area:
		drag_area.gui_input.connect(_on_target_input_event)
		


func _physics_process(_delta: float) -> void:
	if dragging and drag_area:
		var mouse_pos = drag_area.get_global_mouse_position()
		target.global_position = Vector2(clamp(mouse_pos.x + offset.x, 0 , Utils.screen_size.x-target.size.x),
		clamp(mouse_pos.y + offset.y, 0 ,Utils.screen_size.y-target.size.y))


func _input(event: InputEvent) -> void:
	if dragging and event.is_action_pressed("mouse_right"):
		_cancel_dragging()
	elif dragging and event.is_action_released("mouse_left"):
		_drop()


func _end_dragging() -> void:
	dragging = false
	drag_area.remove_from_group("dragging")
	#target.z_index = 0


func _cancel_dragging() -> void:
	_end_dragging()
	drag_canceled.emit(starting_position)


func _start_dragging() -> void:
	dragging = true
	starting_position = drag_area.global_position
	drag_area.add_to_group("dragging")
	
	var maxindex = target.get_parent().get_children().size()
	target.get_parent().move_child(target, maxindex - 1)
	
	offset = get_parent().global_position - get_parent().get_global_mouse_position()
	drag_started.emit()


func _drop() -> void:
	_end_dragging()
	dropped.emit(starting_position)


func _on_target_input_event(event: InputEvent) -> void:
	if not enabled:
		return

	var dragging_object := get_tree().get_first_node_in_group("dragging")
	
	if not dragging and dragging_object:
		return
	
	if not dragging and event.is_action_pressed("mouse_left"):
		_start_dragging()
