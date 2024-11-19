extends Control

@export var event: BaseEvent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	%Avatar.texture = event.avatar
	%Name.text = event.eventName
	%Desc.text = event.eventDesc
	event.get_event_button(self)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_accept_pressed() -> void:
	queue_free()


func _on_refuse_pressed() -> void:
	queue_free()


func _on_cancel_pressed() -> void:
	hide()


func _on_known_pressed() -> void:
	queue_free()
