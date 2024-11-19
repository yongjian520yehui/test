@tool
extends Tree

@onready var label: Label = $"../../VBoxContainer2/Label"

var code_resource 

func _ready() -> void:
	code_resource = ResourceLoader.load("res://scene/judge_scene/script/code.tres")
	var root: TreeItem = create_item()
	root.set_text(0, code_resource.code_name)
	for i in code_resource.sub_code_name:
		var child: TreeItem = create_item(root)
		child.set_text(0, i)
	#var subchild1_1: TreeItem = create_item(child1)
	#subchild1_1.set_text(0, "天堂")
	#var subchild1_1_1: TreeItem = create_item(subchild1_1)
	#subchild1_1.set_text(0, "天堂")
	#
	#
	#
	#var child2: TreeItem = create_item(root)
	#child2.set_text(0, "地狱")
	#var subchild2_1: TreeItem = create_item(child2)
	#subchild2_1.set_text(0, "你的宗教不对")
	#var subchild2_2: TreeItem = create_item(child2)
	#subchild2_2.set_text(0, "你的宗教不符合规定")


func _on_item_selected() -> void:
	var treeItemText = self.get_selected().get_text(self.get_selected_column())
	if code_resource.sub_code_detials[treeItemText]:
		label.text = code_resource.sub_code_detials[treeItemText]
