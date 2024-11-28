extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	var data = DataServer.current_ghost.ghost_data
	%Logo.texture = data.license_logo
	%Name.text = data.license_name
	%license_now_ghostname.text = data.license_now_ghostname
	%license_now_id.text = data.license_now_id
	%license_next_lifeinfo.text = data.license_next_lifeinfo
	%license_next_fatherinfo.text = data.license_next_fatherinfo
	%license_next_matherinfo.text = data.license_next_matherinfo
	%license_ValidPeriod.text = data.license_ValidPeriod
	%Stamp.texture = data.license_stamp
	%license_effective_date.text = data.license_effective_date





func _on_close_pressed() -> void:
	hide()
