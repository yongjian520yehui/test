extends Control

@onready var date: Label = %Date
@onready var salary: Label = %Salary
@onready var saved_money: Label = %SavedMoney
@onready var fine: Label = %Fine
@onready var cost: Label = %Cost
@onready var end: Button = %End
@onready var timer: Timer = $Timer
@onready var count = %Count


var countArray : Array[Node]
var exeTime = 0
# 定义一些变量  
var column_index = 0  # 当前显示的列索引  

func _on_end_pressed() -> void:
	get_tree().change_scene_to_file(Utils.JUDGE_SENCE)
	Utils.year += 1
	DataServer.current_date["year"] += 1
	DataServer.save_game()

# 在脚本加载时调用  
func _ready():  
	date.text = "第 "+str(Utils.year)+" 年"
	countArray = %VBoxContainerCount.get_children()
	for childnode in countArray:  
		if is_instance_of(childnode , HBoxContainer):  
			childnode.visible = false
	saved_money.text = str(Utils.saved_money)
	salary.text = str(Utils.salary)
	fine.text = str(Utils.fine)
	cost.text = str(Utils.cost)
	var cost_count = 0 
	for i in Utils.cost.values():
		cost_count += i
	var count_money = Utils.saved_money+Utils.salary-Utils.fine-cost_count
	count.text = str(count_money)
	Utils.saved_money = count_money
	
	timer.start()
  
# 逐列显示的处理函数  
func show_next_column():  
	if column_index < countArray.size():  
		var childnode = countArray[column_index] 
		childnode.visible = true
		column_index += 1  
	else:  
		timer.stop()
		
func _on_timer_timeout() -> void:
	show_next_column()
