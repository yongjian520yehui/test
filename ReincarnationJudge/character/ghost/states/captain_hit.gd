class_name CaptainHit
extends StateBase


func enter() -> void:
	character.animation_player.play("hit")
	await character.animation_player.animation_finished

	character.is_hurt = false

	transition_to("Idle")


func physics_update(_delta: float) -> void:
	pass
	#if character.velocity.x != 0:
		#character.velocity.x = move_toward(character.velocity.x, 0, 8)
