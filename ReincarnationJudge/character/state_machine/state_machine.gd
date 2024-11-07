class_name StateMachine
extends Node
## 状态机节点

## 初始状态
@export var initial_state: StateBase

## 是否运行状态机 ，由基础角色类中readey方法控制
var _started: bool = false
## 状态字典
var _states: Dictionary = {}
## 当前状态
var current_state: StateBase = null
## 当前状态运行时间
var current_state_run_time: float = 0.0
## 下一状态, 仅在exit方法中有效
var next_state: String = ""
## 历史状态
var _history_states: Array[String] = []


func _ready() -> void:
##	状态机获取所有状态名，将状态的状态机设为自己
	for state: StateBase in get_children():
		state.state_machine = self
		if owner is BasicCharacter:
			state.character = owner
		
		_states[state.name] = state
##	设置初始状态
	if initial_state:
		_add_history_state(initial_state.name)
		initial_state.enter()
		current_state = initial_state

## 每帧都在检测状态更新，和状态持续时间
func _physics_process(delta: float) -> void:
	if _started and current_state:
		current_state_run_time += delta
		current_state.physics_update(delta)
		
## update暂时不用
func _process(delta: float) -> void:
	if _started and current_state:
		current_state.update(delta)

## 鼠标进入角色时，调用角色当前状态中的处理方法
func _on_area_2d_mouse_entered():
	if _started and current_state:
		current_state._on_area_2d_mouse_entered()

## 鼠标离开角色时，调用角色当前状态中的处理方法
func _on_area_2d_mouse_exited():
	if _started and current_state:
		current_state._on_area_2d_mouse_exited()

## 调用角色当前状态中的输入事件处理方法
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if _started and current_state:
		current_state._on_area_2d_input_event(event)

## 切换状态
func change_state(from: StateBase, to: String) -> void:
	print(from.name, " -> ", to)
	var cs: StateBase = current_state
	current_state = null
	##判断当前方法传入的状态和自己获取到的current_state是不是一致
	if cs != from:
		print("warning: current_state与from不一致, from: ", from, " current_state: ", cs)
		#return
	##从状态字典中获取新的状态
	var new_state: StateBase = _states.get(to)
	if !new_state:
		print("error: 不存在状态: ", to)
		return
	
	## 下一状态, 仅在exit方法中有效
	next_state = new_state.name
	## 调用当前状态的退出方法，没有则无效果
	cs.exit()
	next_state = ""
	_add_history_state(new_state.name)
	## 执行新状态的enter方法，设置状态时间为0，将current_state赋值为新状态
	new_state.enter()
	current_state_run_time = 0.0
	
	current_state = new_state

## 状态机开启
func start() -> void:
	_started = true

## 状态机关闭
func stop() -> void:
	_started = false
	
## 角色历史状态
func _add_history_state(state_name: String) -> void:
	_history_states.append(state_name)
	if _history_states.size() > 20:
		_history_states.remove_at(0)
	

## 获取历史状态, 参数为回退的步数, 例如history_state(1)表示上一个状态
func history_state(back: int) -> String:
	var pos := _history_states.size() - 1 - back
	if pos < 0:
		#print("message: 获取回退", back, "步的历史状态名失败, pos: ", pos)
		return ""
	else:
		return _history_states[pos]
