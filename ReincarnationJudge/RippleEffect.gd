extends Sprite2D

# 声明Shader和uniform变量
@onready var ripple_shader: Shader = preload("res://WaterRipple.gdshader")
@onready var material1: CanvasItemMaterial = CanvasItemMaterial.new()
# 变量来存储点击位置
var click_position: Vector2
var click_effect_duration = 0.5  # 点击效果持续时间（秒）
var click_effect_start_time = 0.0  # 点击效果开始时间
var is_clicked = false  # 是否已点击
var mouse_pos: Vector2 = Vector2.ZERO

func _ready():
	## 将Shader应用到材质
	#material.shader = ripple_shader
	#self.material_override = material
	pass
	# 监听输入事件
	#add_user_action("mouse_moved", Input.MOUSE_MOTION, Input.PRIORITY_HIGH)

func _process(delta: float) -> void:
		self.position = get_global_mouse_position()


func _input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == 1:
		mouse_pos = get_global_mouse_position()
		update_uniforms(mouse_pos)

func update_uniforms(mouse_pos):
	# 更新Shader中的uniform变量
	material.set_shader_parameter("wave_center", mouse_pos)
	material.set_shader_parameter("TEXTURE_SIZE", Vector2(100,100))
