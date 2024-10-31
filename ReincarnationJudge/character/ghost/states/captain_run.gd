class_name CaptainRun
extends StateBase

#var run_dust: Dust = null
var can_generate_dust: bool = false
var dust_wait_time: float
var is_creating_dust: bool = false

func enter() -> void:
	character.animation_player.play("attack")
	await character.animation_player.animation_finished

	character.is_attack = false

	transition_to("Idle")


func physics_update(delta: float) -> void:
	pass
		#run_dust = DustCreater.generete(DustCreater.RUN_DUST, character.graphics, Vector2(-3, 0))
