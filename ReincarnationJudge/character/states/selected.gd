class_name Selected
extends StateBase

#var run_dust: Dust = null
var can_generate_dust: bool = false
var dust_wait_time: float
var is_creating_dust: bool = false

func enter() -> void:
	character.outline_highlighter.highlight()
	character.z_index = 1

func _on_area_2d_input_event(event: InputEvent) -> void:
	if ( event is InputEventMouseButton and event.is_pressed() and event.button_index == 1):
		character.outline_highlighter.clear_highlight()
		character.z_index = 0
		character.is_selected = false
		transition_to("Idle")


func physics_update(_delta: float) -> void:
	if  not character.is_selected :
		character.outline_highlighter.clear_highlight()
		character.z_index = 0
		transition_to("Idle")
		return
		#run_dust = DustCreater.generete(DustCreater.RUN_DUST, character.graphics, Vector2(-3, 0))
