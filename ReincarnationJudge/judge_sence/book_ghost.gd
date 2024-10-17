extends Control

@onready var v_box_container = $VBoxContainer
@onready var book_ghost = $"."
@export var fade_in_duration := 0.3
@export var fade_out_duration := 0.2
@onready var ghost_name = %Name

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_close_pressed() -> void:
	book_ghost.visible = false

func open() -> void:
	var ghost_data = Utils.load_json_file("res://ghost_data/nomal_ghost.json")
	##var ghost_name = book_ghost.get_node("%name")
	ghost_name.text = ghost_data["day1"][0]["baseInfo"]["name"]
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
