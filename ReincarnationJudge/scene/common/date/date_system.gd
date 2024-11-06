extends Node  
class_name DateSystem

@export var speed := 1.0
@export var show : Node
@onready var timer: Timer = $Timer

# 定义初始日期  
var current_date = {  
	"year": 2023,  
	"month": 1,  
	"day": 1,  
	"hour": 0,  
	"minute": 0,  
	"second": 0  
}  

func _ready() -> void:
	set_speed(speed)

func set_speed(speed):
	timer.wait_time = 1.0 / speed
	#print(1 / speed)
  
# 定时器超时处理函数  
func _on_timer_timeout():  
	# 更新秒数  
	current_date.second += 1
	  
	# 检查是否需要更新分钟、小时、日期等  
	if current_date.second >= 60:  
		current_date.second = 0  
		current_date.minute += 1  
		  
	if current_date.minute >= 60:  
		current_date.minute = 0  
		current_date.hour += 1  
		  
	if current_date.hour >= 24:  
		current_date.hour = 0  
		#update_date()  
	
		# 每月的天数  
	var days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]  
	  
	# 如果是闰年，二月有29天  
	if is_leap_year(current_date.year):  
		days_in_month[1] = 29  
	  
	# 更新天数  
	current_date.day += 1  
	  
	if current_date.day > days_in_month[current_date.month - 1]:  
		current_date.day = 1  
		current_date.month += 1  
		  
	if current_date.month > 12:  
		current_date.month = 1  
		current_date.year += 1  
  
# 更新日期函数（处理月份和年份的变化）  
func update_date():  
	# 每月的天数  
	var days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]  
	  
	# 如果是闰年，二月有29天  
	if is_leap_year(current_date.year):  
		days_in_month[1] = 29  
	  
	# 更新天数  
	current_date.day += 1  
	  
	if current_date.day > days_in_month[current_date.month - 1]:  
		current_date.day = 1  
		current_date.month += 1  
		  
	if current_date.month > 12:  
		current_date.month = 1  
		current_date.year += 1  
  
# 检查是否是闰年  
func is_leap_year(year):  
	return (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0)  
  
# 打印当前日期和时间（用于调试）  
func _process(delta):  
	var time = print_date()
	#print(is_instance_of(show, Label))
	if is_instance_of(show, Label):
		show.text = time
  
# 打印当前日期和时间的格式化输出  
func print_date():  
	#print("{current_date.year}-{current_date.month:02}-{current_date.day:02} {current_date.hour:02}:{current_date.minute:02}:{current_date.second:02}")
	#print(current_date)
	var string = Time.get_datetime_string_from_datetime_dict(current_date,true)

	var timeArray = string.split(" ",true,2)
	var time = timeArray[0]
	#print(time)
	return time
