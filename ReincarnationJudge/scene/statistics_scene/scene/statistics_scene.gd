extends Control

@onready var date: Label = %Date
@onready var salary: Label = %Salary
@onready var saved_money: Label = %SavedMoney
@onready var fine: Label = %Fine
@onready var cost: Label = %Cost
@onready var end: Button = %End
@onready var timer: Timer = $Timer
@onready var count = %Count

# 存储逐列所有节点数组  
var countArray : Array[Node]

# 定义逐列显示索引  
var column_index = 0  # 当前显示的列索引  

func _on_end_pressed() -> void:
	##年数自增1
	DataServer.current_date["year"] += 1
	##存档
	DataServer.save_game(DataServer.auto_save_file_path)
	##跳转审判场景
	get_tree().change_scene_to_file(Utils.JUDGE_SENCE)


# 在脚本加载时调用，加载当年的数据
func _ready():  
	##第几年标签
	date.text = "第 "+str(DataServer.current_date["year"]-2022)+" 年"
	##统计的条目
	countArray = %VBoxContainerCount.get_children()
	for childnode in countArray:  
		if is_instance_of(childnode , HBoxContainer):  
			childnode.visible = false

	##之前存款
	saved_money.text = str(Utils.saved_money)
	##工资
	salary.text = str(Utils.salary)
	##罚款
	fine.text = str(Utils.fine)
	##消耗
	cost.text = str(Utils.cost)
	var cost_count = 0 
	for i in Utils.cost.values():
		cost_count += i
	##总计剩余
	var count_money = Utils.saved_money+Utils.salary-Utils.fine-cost_count
	count.text = str(count_money)
	##重新赋值全局存款
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

# 逐列显示的计时器  
func _on_timer_timeout() -> void:
	show_next_column()
