extends Control

@onready var v_box_container = $VBoxContainer
@onready var book_ghost = $"."
@export var fade_in_duration := 1
@export var fade_out_duration := 1
@onready var ghost_name = %Name
@onready var country: Label = %Country
@onready var religion: Label = %Religion


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func close() -> void:
	#var tween := create_tween()
	#tween.tween_property(
		#self,
		#^"modulate:a",
		#0.0,
		#fade_out_duration
	#).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
	#tween.tween_property(
		#book_ghost,
		#^"anchor_bottom",
		#0.5,
		#fade_out_duration
	#).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	#z_index = 0
	pass

func open(ghost) -> void:
	z_index=1
	%Name.text = ghost.ghostname
	%Country.text = ghost.country
	%Religion.text = ghost.religion
	%Sex.text= ghost.sex
	%DeathReason.text= ghost.death_reason

	#modulate.a = 0.0
	#v_box_container.anchor_bottom = 0.5
	#var tween := create_tween()
	#tween.tween_property(
		#self,
		#^"modulate:a",
		#1.0,
		#fade_in_duration
	#).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	#tween.parallel().tween_property(
		#v_box_container,
		#^"anchor_bottom",
		#1.0,
		#fade_out_duration
	#).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
