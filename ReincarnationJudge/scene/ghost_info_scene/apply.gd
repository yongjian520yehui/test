extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if %PassTexture.visible == true or %RejectTexture.visible == true:
		%ButtonArea.hide()
	else:
		%ButtonArea.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


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
	
