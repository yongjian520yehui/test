class_name GhostIn
extends StateBase

const COYOTE_TIME: float = 0.1

#var fall_dust: Dust = null
var can_coyote_jump: bool = false


func enter() -> void:
	print(character.animation_player.animation)
	#character.animation_player.play("in")
	await character.animation_player.animation_finished
	transition_to("Idle")

#func exit() -> void:
	#fall_dust = DustCreater.generete(DustCreater.FALL_DUST, get_tree().current_scene, character.global_position)
	#fall_dust.free_deferred()
	

func update(_delta: float) -> void:
	pass
	

func physics_update(_delta: float) -> void:
	if character.is_hurt:
		transition_to("CaptainHit")
		return
