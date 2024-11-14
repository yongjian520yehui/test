extends Control

@onready var judge: Button = $VBoxContainer/HBoxContainer2/Judge
@onready var cancel: Button = $VBoxContainer/HBoxContainer2/Cancel
@onready var first_selection: OptionButton = $VBoxContainer/HBoxContainer/FirstSelection
@onready var second_tiantang: OptionButton = $"VBoxContainer/HBoxContainer/Second-tiantang"
@onready var second_diyu: OptionButton = $"VBoxContainer/HBoxContainer/Second-diyu"
@onready var second_renjian: OptionButton = $"VBoxContainer/HBoxContainer/Second-renjian"
@onready var color_rect = $ColorRect
@onready var v_box_container = $VBoxContainer

signal judged

var first: String
var second: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	##背景大小计算
	color_rect.size = v_box_container.size

##确定按钮
func _on_judge_pressed() -> void:
	##判断审判的选项
	var select_id: int = first_selection.selected
	var item_string: String = first_selection.get_item_text(select_id)
	match select_id:
		0:
			var second_tiantang_item_string: String = second_tiantang.get_item_text(second_tiantang.selected)
			print(item_string+"->"+second_tiantang_item_string)
		1:
			var second_diyu_item_string: String = second_diyu.get_item_text(second_diyu.selected)
			print(item_string+"->"+second_diyu_item_string)
		2:
			var second_renjian_item_string: String = second_renjian.get_item_text(second_renjian.selected)
			print(item_string+"->"+second_renjian_item_string)
	##隐藏审判选项
	hide()
	judged.emit()
	
		
	##下一个按钮可以点击
	%NextButton.disabled = false
	%GhostBookButton.disabled = false
	%GhostBookButton.hide()
	
##取消按钮
func _on_cancel_pressed() -> void:
	##隐藏审判选项
	hide()
	##审判按钮可以点击
	%JudgeButton.disabled = false
	%GhostBookButton.disabled = false

##选项的显示和隐藏
func _on_first_selection_item_selected(index: int) -> void:
	match index:
		0:
			second_tiantang.show()
			second_diyu.hide()
			second_renjian.hide()
		1:
			second_tiantang.hide()
			second_diyu.show()
			second_renjian.hide()
		2:
			second_tiantang.hide()
			second_diyu.hide()
			second_renjian.show()
