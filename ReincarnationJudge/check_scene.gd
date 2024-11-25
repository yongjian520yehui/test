extends Node

func _ready():
	
	print(Utils.screen_size)
	%TopLetCollisionShape.shape.size = Utils.screen_size
	%TopRightCollisionShape.shape.size = Utils.screen_size
	%BottomLeftCollisionShape2D.shape.size = Utils.screen_size
	%BottomRightCollisionShape2D.shape.size = Utils.screen_size
	
	#%TopLet.global_position = Vector2.ZERO
	%TopLetCollisionShape.global_position = Vector2.ZERO
	
	#%TopRight.global_position = Vector2(Utils.screen_size.x/2, 0 )
	%TopRightCollisionShape.global_position = Vector2(Utils.screen_size.x, 0)
	
	#%BottomLeft.global_position = Vector2(0, Utils.screen_size.y/2)
	%BottomLeftCollisionShape2D.global_position = Vector2(0, Utils.screen_size.y)
	
	#%BottomRight.global_position = Utils.screen_size/2
	%BottomRightCollisionShape2D.global_position = Vector2(Utils.screen_size.x, Utils.screen_size.y)
	#$Table
	$Camera2D.global_position = Utils.screen_size/2





func _on_top_let_mouse_entered():
	var tween = create_tween().tween_property($Camera2D,"position",Utils.screen_size/4, 0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	await tween.finished

func _on_top_right_mouse_entered():
	var tween = create_tween().tween_property($Camera2D,"position",Vector2(Utils.screen_size.x*0.75, Utils.screen_size.y*0.25), 0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	await tween.finished


func _on_bottom_left_mouse_entered():
	var tween = create_tween().tween_property($Camera2D,"position",Vector2(Utils.screen_size.x*0.25, Utils.screen_size.y*0.75), 0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	await tween.finished


func _on_bottom_right_mouse_entered():
	var tween = create_tween().tween_property($Camera2D,"position",Vector2(Utils.screen_size.x*0.75, Utils.screen_size.y*0.75), 0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	await tween.finished
