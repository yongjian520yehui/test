class_name StateBase
extends Node
## 状态类父节点

## 所属状态机
var state_machine: StateMachine

## 所属角色
var character: BasicCharacter


func enter() -> void:
	pass
	

func exit() -> void:
	pass

func _on_area_2d_mouse_entered():
	pass


func _on_area_2d_mouse_exited():
	pass
	
func _on_area_2d_input_event(event: InputEvent) -> void:
	pass

func update(delta: float) -> void:
	pass
	

func physics_update(delta: float) -> void:
	pass

	
func transition_to(to: String) -> void:
	state_machine.change_state(self, to)
