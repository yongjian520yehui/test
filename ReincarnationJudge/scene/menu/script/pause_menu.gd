class_name PauseMenu
extends Control


@export var fade_in_duration := 0.3
@export var fade_out_duration := 0.2

@onready var center_cont := $ColorRect/CenterContainer as CenterContainer
@onready var resume_button := center_cont.get_node(^"VBoxContainer/PauseResumeButton") as Button
@onready var label: Label = $ColorRect/CenterContainer/VBoxContainer/Label

func _process(_delta: float) -> void:
	var tree = get_tree()
	if tree.paused==true:
		label.text="pause"
	else:
		label.text="running"

func _ready() -> void:
	hide()


func close() -> void:
	var tween := create_tween()
	get_tree().paused = false
	tween.tween_property(
		self,
		^"modulate:a",
		0.0,
		fade_out_duration
	).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property(
		center_cont,
		^"anchor_bottom",
		0.5,
		fade_out_duration
	).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_callback(hide)


func open() -> void:
	show()
	resume_button.grab_focus()

	modulate.a = 0.0
	center_cont.anchor_bottom = 0.5
	var tween := create_tween()
	tween.tween_property(
		self,
		^"modulate:a",
		1.0,
		fade_in_duration
	).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	tween.parallel().tween_property(
		center_cont,
		^"anchor_bottom",
		1.0,
		fade_out_duration
	).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)

func _on_resume_button_pressed() -> void:
	get_tree().paused = false
	close()


func _on_quit_button_pressed() -> void:
	if visible:
		get_tree().quit()


func _on_pause_back_main_menu_button_pressed() -> void:
	if visible:
		get_tree().paused = false
		#close()
		get_tree().change_scene_to_file("res://main.tscn")
		

func _on_pause_setting_button_pressed() -> void:
	print("设置页面")


func _on_pause_save_button_pressed():
	var data = {"years":Utils.year,"saved_money":Utils.saved_money}
	print("保存中。。。。")
	Utils.save_game(str(data))
	get_tree().paused = false
	close()
