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
