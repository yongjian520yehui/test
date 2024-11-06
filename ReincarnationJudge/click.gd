class_name Click extends Control

@onready var circle = $Circle
@onready var point = $Circle/Point

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_pressed():
				var a = circle.duplicate()
				var b = point.duplicate()
				self.add_child(a)
				a.add_child(b)
				a.global_position = event.global_position
				a.emitting = true
				b.emitting = true
				a.connect("finished",_on_circle_finished.bind(a))

func _on_circle_finished(a):
	a.queue_free()
