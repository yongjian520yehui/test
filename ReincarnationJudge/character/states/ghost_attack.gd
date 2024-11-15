class_name CaptainAttack
extends StateBase

#var run_dust: Dust = null
var can_generate_dust: bool = false
var dust_wait_time: float
var is_creating_dust: bool = false

func enter() -> void:
	#播放攻击动画，等待动画结束
	character.animation_player.play("attack")
	await character.animation_player.animation_finished
	#重置状态，然后切换到空闲状态
	character.is_attack = false
	transition_to("Idle")


func physics_update(_delta: float) -> void:
	pass
		#run_dust = DustCreater.generete(DustCreater.RUN_DUST, character.graphics, Vector2(-3, 0))
