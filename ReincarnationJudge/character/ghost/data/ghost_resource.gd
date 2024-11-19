extends Resource
class_name GhostResource

##对话
@export_category("dialogue")
@export var dialogue_list_before: DialogueList
@export var dialogue_list_ask: DialogueList
@export var dialogue_list_after: DialogueList

##信息资料
@export_category("baseInfo")
@export var ghostname: String
@export var country: String
@export var religion: String
@export var sex: String
@export var death_reason: String
@export var applay: String
@export var event: BaseEvent

##档案信息
@export_category("files")
@export var life_stories: Array
@export var people_evaluation: Array

##资源
@export_category("resource")
@export var sprite_frames: SpriteFrames

##判断和通过影响
@export_category("passInfluence")
@export var is_can_pass: bool
@export var pass_influence: String
@export var refuse_influence: String
