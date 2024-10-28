class_name DateTime
extends Resource

@export_range(0,59) var seconds := 0
@export_range(0,59) var minutes := 0
@export_range(0,23) var hours := 8
@export_range(0,31) var days := 1
@export_range(0,12) var months := 1
@export var years := 2021

var delta_time :float =0 

func increase_by_sec(delta_seconds:float):
	#var time1 = str(days)+":"+str(hours)+":"+str(minutes)+":"+str(seconds)
	#var time = str(hours)+":"+str(minutes)+":"+str(seconds)
	var dict ={"year":years,"month":months,"day":days,"hour":hours,"minute":minutes,"second":seconds}
	var string = Time.get_datetime_string_from_datetime_dict(dict,true)

	var timeArray = string.split(" ",true,2)
	var time = timeArray[1]

	delta_time += delta_seconds
	if delta_time <1 :return time
	
	var delta_int_secs : int = delta_time
	delta_time -= delta_int_secs
	
	seconds += delta_int_secs
	minutes += seconds / 60
	hours += minutes / 60


	seconds = seconds % 60
	minutes = minutes % 60
	hours = hours % 24

	#days += delta_int_secs
	#months += days / 30
	#years += months / 12
	#
	#days = days % 30
	#months += months % 12
	#years += years
	#print(dict)
	return time
	
