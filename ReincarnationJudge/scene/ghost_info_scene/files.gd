extends PanelContainer

@onready var content_parent: PanelContainer = %Info

var current_page : int = 0
var total_page : Array[Node] 
var data

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	total_page = content_parent.get_children()
	data = DataServer.current_ghost.ghost_data
	
	%Previous.hide()
	
	%Name.text = data.files_ghostname
	%Sex.text = data.files_sex
	%Nationality.text = data.files_nationality
	%Birthday.text = data.files_birthday
	%Country.text = data.files_country
	%DeathDay.text = data.files_deathday
	%DeathReason.text = data.files_death_reason

	if data.files_record:
		for i in data.files_record:
			var label = Label.new()
			%RecordInfo.add_child(label)
			label.autowrap_mode = TextServer.AUTOWRAP_WORD
			label.custom_minimum_size = Vector2(10,5)
			label.text = i

	if data.files_life_stories:
		for i in data.files_life_stories:
			var label = Label.new()
			%LifeStoryInfo.add_child(label)
			label.autowrap_mode = TextServer.AUTOWRAP_WORD
			label.custom_minimum_size = Vector2(10,5)
			label.text = i

	if data.files_evaluation:
		for i in data.files_evaluation:
			var label = Label.new()
			%EvaluationInfo.add_child(label)
			label.autowrap_mode = TextServer.AUTOWRAP_WORD
			label.custom_minimum_size = Vector2(10,5)
			label.text = i





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
