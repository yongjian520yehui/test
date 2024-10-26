extends Control

@onready var v_box_container = $VBoxContainer
@onready var book_ghost = $"."
@export var fade_in_duration := 1
@export var fade_out_duration := 1
@onready var ghost_name = %Name
@onready var country: Label = %Country
#@onready var intro: Label = %Intro
#@onready var evaluation: Label = %Evaluation
#@onready var reason: Label = %Reason
#@onready var applay: Label = %Applay
@onready var religion: Label = %Religion

var starting_position: Vector2
var offset := Vector2.ZERO
var dragging := false

signal drag_canceled(starting_position: Vector2)
signal drag_started
signal dropped(starting_position: Vector2)
@export var enabled: bool = true
@export var target: Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _gui_input(event: InputEvent) -> void:
	if not enabled:
		return

	var dragging_object := get_tree().get_first_node_in_group("dragging")
	
	if not dragging and dragging_object:
		return
	
	if not dragging and Input.is_action_pressed("mouse_left"):
		_start_dragging()
	
	if dragging and Input.is_action_pressed("mouse_right"):
		_cancel_dragging()
		
	elif dragging and Input.is_action_just_released("mouse_left"):
		_drop()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if dragging and target:
		target.global_position = target.get_global_mouse_position() + offset
		
func _on_close_pressed() -> void:
	book_ghost.close()

func close() -> void:
	var tween := create_tween()
	get_tree().paused = false
	tween.tween_property(
		self,
		^"modulate:a",
		0.0,
		fade_out_duration
	).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
	#tween.tween_property(
		#book_ghost,
		#^"anchor_bottom",
		#0.5,
		#fade_out_duration
	#).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_callback(hide)

func open() -> void:
	var ghost_json_data = Utils.ghost_factory()

	ghost_name.text = ghost_json_data["day1"][0]["baseInfo"]["name"]
	country.text = ghost_json_data["day1"][0]["baseInfo"]["country"]
	religion.text = ghost_json_data["day1"][0]["baseInfo"]["religion"]
	
	show()
	#resume_button.grab_focus()

	modulate.a = 0.0
	v_box_container.anchor_bottom = 0.5
	var tween := create_tween()
	tween.tween_property(
		self,
		^"modulate:a",
		1.0,
		fade_in_duration
	).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	tween.parallel().tween_property(
		v_box_container,
		^"anchor_bottom",
		1.0,
		fade_out_duration
	).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)


func reset_after_dragging(starting_position: Vector2) -> void:
	#velocity_based_rotation.enabled = false
	global_position = starting_position

func _on_drag_started() -> void:
	#velocity_based_rotation.enabled = true
	pass

func _on_drag_canceled(starting_position: Vector2) -> void:
	reset_after_dragging(starting_position)

func _end_dragging() -> void:
	dragging = false
	target.remove_from_group("dragging")
	target.z_index = 0

func _cancel_dragging() -> void:
	_end_dragging()
	drag_canceled.emit(starting_position)

func _start_dragging() -> void:
	dragging = true
	print("start draging")
	starting_position = target.global_position
	target.add_to_group("dragging")
	target.z_index = 99
	offset = target.global_position - target.get_global_mouse_position()
	drag_started.emit()

func _drop() -> void:
	_end_dragging()
	dropped.emit(starting_position)
	


