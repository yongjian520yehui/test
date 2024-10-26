extends Area2D
@onready var draganddrop: DragAndDrop = $draganddrop



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not Engine.is_editor_hint():
		draganddrop.drag_started.connect(_on_drag_started)
		draganddrop.drag_canceled.connect(_on_drag_canceled)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func reset_after_dragging(starting_position: Vector2) -> void:
	#velocity_based_rotation.enabled = false
	global_position = starting_position

func _on_drag_started() -> void:
	#velocity_based_rotation.enabled = true
	pass


func _on_drag_canceled(starting_position: Vector2) -> void:
	reset_after_dragging(starting_position)
