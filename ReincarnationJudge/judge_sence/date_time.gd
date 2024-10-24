class_name DateTime
extends Resource

@export_range(0,59) var seconds = 00
@export_range(0,59) var minutes = 00
@export_range(0,23) var hours = 00
@export var days = 00

var delta_time :float =0 

func increase_by_sec(delta_seconds:float) :
	var time = str(days)+":"+str(hours)+":"+str(minutes)+":"+str(seconds)
	delta_time+= delta_seconds
	if delta_time <1 :return time
	
	var delta_int_secs : int = delta_time
	delta_time -= delta_int_secs
	
	seconds += delta_int_secs
	minutes += seconds / 60
	hours += minutes / 60
	days += hours / 24
	
	seconds = seconds % 60
	minutes = minutes % 60
	hours = hours % 24
	
	return time
	
