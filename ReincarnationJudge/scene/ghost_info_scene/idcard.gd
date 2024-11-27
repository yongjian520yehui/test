extends PanelContainer

@onready var back: MarginContainer = $Back
@onready var front: MarginContainer = $Front

var data

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	back.hide()
	data = DataServer.current_ghost.ghost_data
	%Authority.text = data.IDCard_Authority
	%ValidPeriod.text = data.IDCard_ValidPeriod
	%Name.text = data.IDCard_ghostname
	%Sex.text = data.IDCard_sex
	%Nationality.text = data.IDCard_nationality
	%Birthday.text = data.IDCard_birthday
	%Country.text = data.IDCard_country
	%DeathDay.text = data.IDCard_deathday
	%Id.text = data.IDCard_id


func _on_close_button_pressed() -> void:
	hide()


func _on_flip_button_pressed() -> void:
	var is_show = back.visible == false
	back.visible = is_show
	front.visible = not is_show
