extends Node2D
@onready var label: Label = $NinePatchRect/Label
@onready var nine_patch_rect: NinePatchRect = $NinePatchRect
@onready var rich_text_label = $RichTextLabel
@onready var chat_pop: Node2D = $"."

@export var target : Node
var old_size := Vector2.ZERO
var new_size := Vector2.ZERO
var offset := Vector2.ZERO

var text =["切换可见性\n创建节点\n设置 text\n设置 fit_content\n设置 scroll_active\n设置 scroll_active\n设置 scroll_active\n设置 autowrap_mode\n设置 autowrap_mode",
"Vulkan 1.3.280 - Forward Mobile - Using Device #0: NVIDIA - NVIDIA GeForce RTX 2060","Godot Engine v4.3.stable.official.77dcf97d8 - https://godotengine.org"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#nine_patch_rect.size = label.size + Vector2.ONE*10
	showPop("测试开始")
	
func showPop(text):
	old_size = rich_text_label.size
	rich_text_label.text = text
	var max_width = 0
	var max_height = 0

	
	for  line in text.split("\n",false):
		var line_size = rich_text_label.get_theme_default_font().get_string_size(line, HORIZONTAL_ALIGNMENT_LEFT, -1, rich_text_label.get_theme_font_size("font_size"))
		if line_size.x > max_width:
			max_width = line_size.x
		max_height += line_size.y
	rich_text_label.size.y = max_height + 16
	rich_text_label.size.x = max_width + 9
	
	new_size = rich_text_label.size
	offset = new_size - old_size
	
	rich_text_label.global_position.x = target.global_position.x
	rich_text_label.global_position.y -= offset.y
	
	rich_text_label.scale.x = 0
	rich_text_label.rotation = -5.0
	var tween = create_tween()
	tween.tween_property(rich_text_label,"scale:x", 1.0, 0.3).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.set_parallel().tween_property(rich_text_label,"rotation", 0, 0.3).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

func _input(event):
	if event.is_action_pressed("mouse_left"):
		if text.size()==0:
			#nine_patch_rect.visible=false
			rich_text_label.visible=false
			return
		var textString= text.pop_front()
		#showPop1(textString)
		showPop(textString)

#func showPop1(text):
	#label.text = text
	#var max_width = 0
	#var max_height = 0
	#for  line in text.split("\n",false):
		#var line_size = label.get_theme_default_font().get_string_size(line, HORIZONTAL_ALIGNMENT_LEFT, -1, label.get_theme_font_size("font_size"))
		#if line_size.x > max_width:
			#max_width = line_size.x+5
			##print("max_width:",max_width)
		#max_height += line_size.y+5
		##print("max_height:",max_height)
	#
#
	#label.size.y = max_height
	#label.size.x = max_width
	#
	#nine_patch_rect.size = label.size + Vector2(10,10)
	##print(nine_patch_rect.size)
