extends PanelContainer

@onready var Mainmenu = $MarginContainer/HBoxContainer/Menu
@onready var margin_container = $MarginContainer/HBoxContainer/Menu/MarginContainer
@onready var menu_1 = $MarginContainer/HBoxContainer/Menu/MarginContainer/Menu1
@onready var menu_2 = $MarginContainer/HBoxContainer/Menu/MarginContainer/Menu2
@onready var menu_3 = $MarginContainer/HBoxContainer/Menu/MarginContainer/Menu3

# Called when the node enters the scene tree for the first time.
func _ready():
	#先关闭
	Mainmenu.hide()


func _set_menu(menu):
	##取反
	var wasClosed = menu.visible == false
	##先关闭所有的
	_close_all_menus()
	##再设置需要控制的
	Mainmenu.visible = wasClosed
	
	menu.visible = wasClosed

func _close_all_menus():
	for menu in margin_container.get_children():
		menu.visible = false

func _on_menu_1_button_pressed():
	_set_menu(menu_1)


func _on_menu_2_button_pressed():
	_set_menu(menu_2)


func _on_menu_3_button_pressed():
	_set_menu(menu_3)
