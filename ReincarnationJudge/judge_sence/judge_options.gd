extends Control

@onready var judge: Button = $VBoxContainer/HBoxContainer2/Judge
@onready var cancel: Button = $VBoxContainer/HBoxContainer2/Cancel
@onready var first_selection: OptionButton = $VBoxContainer/HBoxContainer/FirstSelection
@onready var second_tiantang: OptionButton = $"VBoxContainer/HBoxContainer/Second-tiantang"
@onready var second_diyu: OptionButton = $"VBoxContainer/HBoxContainer/Second-diyu"
@onready var second_renjian: OptionButton = $"VBoxContainer/HBoxContainer/Second-renjian"


var first: String
var second: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_judge_pressed() -> void:
	var select_id = first_selection.selected
	var item_string = first_selection.get_item_text(select_id)
	visible = false
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
