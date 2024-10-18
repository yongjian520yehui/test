extends Control

@onready var v_box_container = $VBoxContainer
@onready var book_ghost = $"."
@export var fade_in_duration := 1
@export var fade_out_duration := 1
@onready var ghost_name = %Name
@onready var country: Label = %Country
@onready var intro: Label = %Intro
@onready var evaluation: Label = %Evaluation
@onready var reason: Label = %Reason
@onready var applay: Label = %Applay
@onready var religion: Label = %Religion


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


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
