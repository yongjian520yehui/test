extends Control

@export var event: BaseEvent
#@onready var v_box_container: VBoxContainer = $VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	#%Avatar.texture = event.avatar
	%Name.text = event.eventName+":"+event.eventDesc
	%TextureRect.texture = event.avatar
	EventServer.get_event_button(self,event)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_known_pressed() -> void:
	queue_free()
