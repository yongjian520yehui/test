extends Control

@export var event: BaseEvent
@onready var v_box_container: VBoxContainer = $VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	#%Avatar.texture = event.avatar
	%Name.text = event.eventName+":"+event.eventDesc
	%TextureRect.texture = event.avatar
	for i in event.eventActions.action :
		match i:
			0:
				%Known.show()
			1:
				%Accept.show()
			2:
				%Refuse.show()
			3:
				%Cancel.show()
	size = v_box_container.size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_known_pressed() -> void:
	hide()
