class_name GhostOut
extends StateBase

const COYOTE_TIME: float = 0.1

#var fall_dust: Dust = null
var can_coyote_jump: bool = false


func enter() -> void:
	character.animation_player.play("out")
	#await character.animation_player.animation_finished
	#queue_free()

#func exit() -> void:
	#fall_dust = DustCreater.generete(DustCreater.FALL_DUST, get_tree().current_scene, character.global_position)
	#fall_dust.free_deferred()
	

func update(_delta: float) -> void:
	pass
	

func physics_update(_delta: float) -> void:
	if character.is_hurt:
		transition_to("CaptainHit")
		return
