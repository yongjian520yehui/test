extends Node


const NEWS_EVENT = preload("res://utils/event/news_event.tscn")
const REQUEST_EVENT = preload("res://utils/event/request_event.tscn")

signal event_started(node: Node, positon_node:Node, type: String)

func _ready() -> void:
	event_started.connect(add_event)

#获取事件数据
func get_event_data(type: String):
	var event
	match  type:
		"news":
			event = NEWS_EVENT.instantiate()
			var loaded_resource := ResourceLoader.load("res://utils/event/news_event1.tres")
			event.event = loaded_resource
		"request":
			event = REQUEST_EVENT.instantiate()
			var loaded_resource := ResourceLoader.load("res://utils/event/request_event1.tres")
			event.event = loaded_resource
	return event

##根据数组显示事件按钮
func get_event_button(node: Node,event):
	for i in event.eventActions.action :
		match i:
			0:
				node.get_node("%Known").show()
			1:
				node.get_node("%Accept").show()
			2:
				node.get_node("%Refuse").show()
			3:
				node.get_node("%Cancel").show()

func add_event(node: Node, positon_node:Node, type: String):
	##获取场景数下的所有事件
	var events = get_tree().get_nodes_in_group("events")
	var event: VBoxContainer = EventServer.get_event_data(type)
	node.add_child(event)
	event.global_position = positon_node.global_position
	##如果数量小于1
	if events.size() < 1 :
		var tween = get_tree().create_tween().tween_property(event,"position:x",event.global_position.x - event.size.x,0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
		await tween.finished
	else:
		##所有事件上移
		for i in events:
			get_tree().create_tween().tween_property(i,"position:y",i.global_position.y - event.size.y,0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
		#新事件登场
		var tween1 = get_tree().create_tween().tween_property(event,"position:x",event.global_position.x - event.size.x,0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
		await tween1.finished
	##释放超过2个的事件
	if events.size() > 2:
		var tween2 = get_tree().create_tween().tween_property(events[0],"modulate:a",0,0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
		await tween2.finished
		events[0].queue_free()
