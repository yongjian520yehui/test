class_name TimeSystem
extends Node

@export var date_time : DateTime
@export var ticks_per_second :int = 6
@onready var time_label: Label = %TimeLabel

var timeString 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timeString = date_time.increase_by_sec( delta * ticks_per_second )
	if timeString.left(2) == "18":
		get_tree().change_scene_to_file(Utils.STATISTICS_PAGE)
	time_label.text = timeString
