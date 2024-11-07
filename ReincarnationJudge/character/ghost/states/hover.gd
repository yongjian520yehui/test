class_name Hover
extends StateBase

#var run_dust: Dust = null
var can_generate_dust: bool = false
var dust_wait_time: float
var is_creating_dust: bool = false


func enter() -> void:
	character.outline_highlighter.highlight()
	character.z_index = 1


func _on_area_2d_mouse_exited():
	if state_machine.current_state != Selected:
		character.outline_highlighter.clear_highlight()
		character.z_index = 0
		transition_to("Idle")

func _on_area_2d_input_event(event: InputEvent) -> void:
	if ( event is InputEventMouseButton and event.button_index == 1 and event.is_pressed()
	and state_machine._states.has("Selected") ):
		character.is_selected = true 
		transition_to("Selected")


func physics_update(delta: float) -> void:
	pass
		#run_dust = DustCreater.generete(DustCreater.RUN_DUST, character.graphics, Vector2(-3, 0))
