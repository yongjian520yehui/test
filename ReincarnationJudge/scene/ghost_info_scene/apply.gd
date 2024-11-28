extends PanelContainer

var data

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	if %PassTexture.visible == true or %RejectTexture.visible == true:
		%ButtonArea.hide()
	else:
		%ButtonArea.show()
	
	data = DataServer.current_ghost.ghost_data
	%GhostName.text = data.applay_ghostname
	%Sex.text = data.applay_sex
	%Nationality.text = data.applay_nationality
	%Birthday.text = data.applay_birthday
	%Country.text = data.applay_country
	%DeathDay.text = data.applay_deathday
	%ID.text = data.applay_id
	%Type.text = data.applay_type
	%Reason.text = data.applay_reason
	%SpecialRequirements.text = data.applay_require
	%ApplayName.text = data.applay_ghostname
	%PassTexture
	%RejectTexture


func _on_close_pressed() -> void:
	hide()


func _on_pass_pressed() -> void:
	print("pass")
	%PassTexture.show()
	%Pass.hide()
	%Reject.hide()

func _on_reject_pressed() -> void:
	print("reject")
	%RejectTexture.show()
	%Pass.hide()
	%Reject.hide()
	
