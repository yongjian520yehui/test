extends CanvasLayer

var workers
var ghosts
const REQUEST_EVENT = preload("res://utils/event/request_event.tscn")
const APPLY = preload("res://scene/ghost_info_scene/apply.tscn")
const CHECK_LIST = preload("res://scene/ghost_info_scene/check_list.tscn")
const FILES = preload("res://scene/ghost_info_scene/files.tscn")
const IDCARD = preload("res://scene/ghost_info_scene/idcard.tscn")
const LICENSE = preload("res://scene/ghost_info_scene/license.tscn")
const PASSPORT = preload("res://scene/ghost_info_scene/passport.tscn")


@onready var event_position: Control = $EventPosition


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$PapersPosition.global_position = Utils.screen_size/2

	EventServer.push_node=$"."
	EventServer.push_node_positon=$EventPosition


func _on_next_pressed() -> void:
	var papers = get_tree().get_nodes_in_group("papers")
	if papers:
		for i in papers:
			i.queue_free()
	
	DataServer.get_ghost_data("")
	$GhostPosition.add_child(DataServer.current_ghost)
	await DataServer.current_ghost.animation_player.animation_finished
	
	ghosts = get_tree().get_nodes_in_group("ghosts")
	DataServer.get_dialogue_controller(self,ghosts[0],ghosts[0],DataServer.current_ghost.ghost_data.dialogue_list_first)
	var dialogueController: DialogueController = get_tree().get_nodes_in_group("dialogueController")[0]
	await dialogueController.finished
	
	button_show()

func _on_event_pressed() -> void:
	EventServer.event_started.emit("news")


func _on_button_pressed() -> void:
	var fatty_shader = ResourceLoader.load("res://shader/fatty_shader.tres")
	


func _on_id_card_button_pressed() -> void:
	$IDCard.show()

func _on_check_list_button_pressed() -> void:
	if $CheckList:
		$CheckList.show()


func _on_apply_button_pressed() -> void:
	$Apply.show()


func _on_license_button_pressed() -> void:
	$License.show()


func _on_passport_button_pressed() -> void:
	$Passport.show()


func _on_files_button_pressed() -> void:
	$Files.show()


func _on_phone_pressed() -> void:
	pass # Replace with function body.


func _on_code_pressed() -> void:
	pass # Replace with function body.


func _on_wanted_pressed() -> void:
	pass # Replace with function body.


func button_show():
	var data = DataServer.current_ghost.ghost_data
	if data.IDCard_show_immediately and data.IDCard_ghostname:
		%IDCardButton.show()
		var idcard = IDCARD.instantiate()
		add_child(idcard)
		idcard.global_position = $PapersPosition.global_position

	if data.applay_show_immediately and data.applay_ghostname:
		%ApplyButton.show()
		var applay = APPLY.instantiate()
		add_child(applay)
		applay.global_position = $PapersPosition.global_position
		
	if data.license_show_immediately and data.license_now_ghostname:
		%LicenseButton.show()
		var license = LICENSE.instantiate()
		add_child(license)
		license.global_position = $PapersPosition.global_position
		
	if data.passport_show_immediately and data.passport_ghostname:
		%PassportButton.show()
		var passport = PASSPORT.instantiate()
		add_child(passport)
		passport.global_position = $PapersPosition.global_position
		
	if data.files_ghostname:
		%FilesButton.show()
		var files = FILES.instantiate()
		add_child(files)
		files.global_position = $PapersPosition.global_position
	
	var checklist = CHECK_LIST.instantiate()
	add_child(checklist)
	checklist.global_position = $PapersPosition.global_position
