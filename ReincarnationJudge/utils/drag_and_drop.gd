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



func _physics_process(delta: float) -> void:
	if dragging and drag_area:
		target.global_position = drag_area.get_global_mouse_position() + offset


func _input(event: InputEvent) -> void:
	if dragging and event.is_action_pressed("mouse_right"):
		_cancel_dragging()
	elif dragging and event.is_action_released("mouse_left"):
		_drop()


func _end_dragging() -> void:
	dragging = false
	drag_area.remove_from_group("dragging")
	target.z_index = 0


func _cancel_dragging() -> void:
	_end_dragging()
	drag_canceled.emit(starting_position)


func _start_dragging() -> void:
	dragging = true
	starting_position = drag_area.global_position
	drag_area.add_to_group("dragging")
	target.z_index = 99
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
