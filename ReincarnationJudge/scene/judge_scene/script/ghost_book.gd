extends PanelContainer

@onready var Mainmenu: Panel = $MarginContainer/VBoxContainer/HBoxContainer/Menu
@onready var margin_container: MarginContainer = $MarginContainer/VBoxContainer/HBoxContainer/Menu/MarginContainer
@onready var menu_1: GridContainer = $MarginContainer/VBoxContainer/HBoxContainer/Menu/MarginContainer/Menu1
@onready var menu_2: GridContainer = $MarginContainer/VBoxContainer/HBoxContainer/Menu/MarginContainer/Menu2
@onready var menu_3: GridContainer = $MarginContainer/VBoxContainer/HBoxContainer/Menu/MarginContainer/Menu3


# Called when the node enters the scene tree for the first time.
func _ready():
	#先关闭
	#Mainmenu.hide()
	pass


func _set_menu(menu):
	##取反
	var wasClosed = menu.visible == false
	##先关闭所有的
	_close_all_menus()
	##再设置需要控制的
	#Mainmenu.visible = wasClosed
	
	menu.visible = wasClosed

func _close_all_menus():
	for menu in margin_container.get_children():
		menu.visible = false


func _on_base_info_button_pressed() -> void:
	print(111)
	_set_menu(menu_1)


func _on_death_reason_button_pressed() -> void:
	_set_menu(menu_2)


func _on_apply_button_pressed() -> void:
	_set_menu(menu_3)


func _on_close_button_pressed() -> void:
	hide()
