extends Control

@onready var judge: Button = $VBoxContainer/HBoxContainer2/Judge
@onready var cancel: Button = $VBoxContainer/HBoxContainer2/Cancel
@onready var first_selection: OptionButton = $VBoxContainer/HBoxContainer/FirstSelection
@onready var second_1: OptionButton = $"VBoxContainer/HBoxContainer/Second-1"
@onready var second_2: OptionButton = $"VBoxContainer/HBoxContainer/Second-2"
@onready var second_3: OptionButton = $"VBoxContainer/HBoxContainer/Second-3"

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
