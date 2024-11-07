extends Control

@onready var judge: Button = $VBoxContainer/HBoxContainer2/Judge
@onready var cancel: Button = $VBoxContainer/HBoxContainer2/Cancel
@onready var first_selection: OptionButton = $VBoxContainer/HBoxContainer/FirstSelection
@onready var second_tiantang: OptionButton = $"VBoxContainer/HBoxContainer/Second-tiantang"
@onready var second_diyu: OptionButton = $"VBoxContainer/HBoxContainer/Second-diyu"
@onready var second_renjian: OptionButton = $"VBoxContainer/HBoxContainer/Second-renjian"
@onready var color_rect = $ColorRect
@onready var v_box_container = $VBoxContainer


var first: String
var second: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_rect.size = v_box_container.size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_judge_pressed() -> void:
	var select_id = first_selection.selected
	var item_string = first_selection.get_item_text(select_id)
	visible = false
	var ghosts = get_tree().get_nodes_in_group("ghosts")
	for i in ghosts:
		#get_tree().create_tween().tween_property(i,^"modulate:a", 0, 1.0).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)

		i.queue_free()
	print(item_string)
	
	
	
func _on_cancel_pressed() -> void:
	visible = false


func _on_first_selection_item_selected(index: int) -> void:
	match index:
		0:
			second_tiantang.visible= true
			second_diyu.visible= false
			second_renjian.visible= false
		1:
			second_tiantang.visible= false
			second_diyu.visible= true
			second_renjian.visible= false
		2:
			second_tiantang.visible= false
			second_diyu.visible= false
			second_renjian.visible= true
