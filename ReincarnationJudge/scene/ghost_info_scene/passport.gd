extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	var data = DataServer.current_ghost.ghost_data
	
	%PassName.text = data.passport_passname
	%PassType.text = data.passport_passtype
	%CountryCode.text = data.passport_countrycode
	%PassNumber.text = data.passport_number
	%Logo.texture = data.passport_logo
	
	%GhostName.text = data.passport_ghostname
	%ID.text = data.passport_id
	%Authority.text = data.passport_Authority
	%IssuePlace.text = data.passport_issueplace
	%ValidPeriod.text = data.passport_ValidPeriod
	%Destination.text = data.passport_destination
	





func _on_close_pressed():
	hide()
