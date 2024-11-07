class_name CaptainIdle
extends StateBase


func enter() -> void:
	character.animation_player.play("idle")


func _on_area_2d_mouse_entered():
	if state_machine.current_state != Selected and state_machine._states.has("Hover") :
		transition_to("Hover")


func physics_update(delta: float) -> void:
	if character.is_hurt:
		if state_machine._states.has("Hit") :
			transition_to("Hit")
			return
	if character.is_attack:
		if state_machine._states.has("Attack") :
			transition_to("Attack")
			return
	if character.is_selected:
		if  state_machine._states.has("Selected") :
			transition_to("Selected")
			return
