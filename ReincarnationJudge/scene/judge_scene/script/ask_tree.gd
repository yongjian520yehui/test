@tool
extends Tree


func _ready() -> void:
	var root: TreeItem = create_item()
	root.set_text(0, "问题")
	var child1: TreeItem = create_item(root)
	child1.set_text(0, "名字")
	var subchild1_1: TreeItem = create_item(child1)
	subchild1_1.set_text(0, "你的名字不对")
	var child2: TreeItem = create_item(root)
	child2.set_text(0, "宗教")
	var subchild2_1: TreeItem = create_item(child2)
	subchild2_1.set_text(0, "你的宗教不对")
	var subchild2_2: TreeItem = create_item(child2)
	subchild2_2.set_text(0, "你的宗教不符合规定")
