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
@export var death_time: String
@export var death_reason: String
@export var weight: String
@export var height: String
@export var job: String

##申请表
@export_category("applay")
@export var applay: String
@export var father_name: String
@export var mather_name: String
@export var next_country: String
@export var event: BaseEvent

##档案信息
@export_category("files")
@export var life_stories: Array
@export var people_evaluation: Array

##资源
@export_category("resource")
@export var sprite_frames: SpriteFrames
#@export var national_flag: Texture

##判断和通过影响
@export_category("passInfluence")
@export var is_can_pass: bool
@export var pass_influence: String
@export var refuse_influence: String
