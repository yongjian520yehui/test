class_name GhostJump
extends StateBase

#var jump_dust: Dust = null


func enter() -> void:
	character.animation_player.play("jump")
	character.velocity.y = (character as GhostNiuTou).jump_power
	#jump_dust = DustCreater.generete(DustCreater.JUMP_DUST, get_tree().current_scene, character.global_position)
	#get_tree().create_tween()

func exit() -> void:
	#jump_dust.free_deferred()
	pass
	

func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	if character.is_hurt:
		transition_to("CaptainHit")
		return
	if character.is_attack:
		if state_machine._states.has("Attack") :
			transition_to("Attack")
			return
	if character.is_selected:
		if  state_machine._states.has("Selected") :
			transition_to("Selected")
			return
