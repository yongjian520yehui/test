extends PanelContainer

@onready var content_parent: PanelContainer = %Info
@onready var life_story_tree: Tree = %LifeStoryTree

var current_page : int = 0
var total_page : Array[Node] 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	total_page = content_parent.get_children()
	%Previous.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_close_pressed() -> void:
	hide()


func _on_next_pressed() -> void:
	current_page += 1
	_show_page(current_page)


func _on_previous_pressed() -> void:
	current_page -= 1
	_show_page(current_page)

func _show_page(current_page):
	for i in total_page:
		i.hide()
	total_page[current_page].show()
	
	if current_page == total_page.size() -1:
		%Next.hide()
		%Previous.show()
		
	if current_page == 0:
		%Previous.hide()
		%Next.show()
		
	if current_page>0 and current_page < total_page.size() -1:
		%Next.show()
		%Previous.show()
