extends Node  
class_name DateSystem

@export var speed := 1.0
@export var show : Node
@onready var timer: Timer = $Timer


func _ready() -> void:
	set_speed(speed)

##设置时间流逝速度
func set_speed(speed):
	timer.wait_time = 1.0 / speed
  
# 定时器超时处理函数  
func _on_timer_timeout():  
	# 更新秒数  
	DataServer.current_date.second += 1
	  
	# 检查是否需要更新分钟、小时、日期等  
	if DataServer.current_date.second >= 60:  
		DataServer.current_date.second = 0  
		DataServer.current_date.minute += 1  
		  
	if DataServer.current_date.minute >= 60:  
		DataServer.current_date.minute = 0  
		DataServer.current_date.hour += 1  
		  
	if DataServer.current_date.hour >= 24:  
		DataServer.current_date.hour = 0  
		#update_date()  
	
		# 每月的天数  
	var days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]  
	  
	# 如果是闰年，二月有29天  
	if is_leap_year(DataServer.current_date["year"]):  
		days_in_month[1] = 29  
	  
	# 更新天数  
	DataServer.current_date.day += 1  
	  
	if DataServer.current_date.day > days_in_month[DataServer.current_date.month - 1]:  
		DataServer.current_date.day = 1  
		DataServer.current_date.month += 1  
		  
	if DataServer.current_date.month > 12:  
		DataServer.current_date.month = 1  
		DataServer.current_date.year += 1  
  
# 更新日期函数（处理月份和年份的变化）  
func update_date():  
	# 每月的天数  
	var days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]  
	  
	# 如果是闰年，二月有29天  
	if is_leap_year(DataServer.current_date["year"]):  
		days_in_month[1] = 29  
	  
	# 更新天数  
	DataServer.current_date.day += 1  
	  
	if DataServer.current_date.day > days_in_month[DataServer.current_date.month - 1]:  
		DataServer.current_date.day = 1  
		DataServer.current_date.month += 1  
		  
	if DataServer.current_date.month > 12:  
		DataServer.current_date.month = 1  
		DataServer.current_date.year += 1  
  
# 检查是否是闰年  
func is_leap_year(years):  
	var year = years as int
	return (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0)  
  
# 打印当前日期和时间（用于调试）  
func _process(_delta):  
	var time = print_date()
	if is_instance_of(show, Label):
		show.text = time
  
# 打印当前日期和时间的格式化输出  
func print_date():  
	var string = Time.get_datetime_string_from_datetime_dict(DataServer.current_date,true)

	var timeArray = string.split(" ",true,2)
	var time = timeArray[0]

	return time
