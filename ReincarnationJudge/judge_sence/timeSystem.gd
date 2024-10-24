class_name TimeSystem
extends Node

@onready var time_label = %TimeLabel
@export var date_time : DateTime
@export var ticks_per_second :int = 6

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var timeString = date_time.increase_by_sec(delta*ticks_per_second)
	#print(timeString)
	#if typeof(timeString) == TYPE_STRING:
	time_label.text = timeString
	
