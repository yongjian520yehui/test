class_name BaseEvent
extends Resource

@export var eventName := "eventName"
@export var eventDesc := "eventDesc"
@export var eventActions : BaseAction
@export var avatar : = Texture2D
@export var dialogue : DialogueList
var costResource 

enum eventFrom {GHOST_EVENT,GHOST_NPC_EVENT,FAMILY_EVENT,REAL_WORLD_EVENT,BIGFAMILY_EVENT,}
enum eventType {MESSAGE_EVENT,CHAT_EVENT}



func event_factory(eventName,eventDesc,eventActions,avatar,dialogue):
	pass


##根据数组显示事件按钮
func get_event_button(node: Node):
	for i in self.eventActions.action :
		match i:
			0:
				node.get_node("%Known").show()
			1:
				node.get_node("%Accept").show()
			2:
				node.get_node("%Refuse").show()
			3:
				node.get_node("%Cancel").show()
