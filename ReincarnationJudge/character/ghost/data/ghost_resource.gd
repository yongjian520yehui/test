extends Resource
class_name GhostResource

##对话
@export_category("dialogue_begin")
@export var dialogue_list_first: DialogueList
@export_category("dialogue_ask")
@export var dialogue_list_IDcard: DialogueList
@export var dialogue_list_passport: DialogueList
@export var dialogue_list_applay: DialogueList
@export var dialogue_list_licence: DialogueList
@export_category("dialogue_end")
@export var dialogue_list_pass: DialogueList
@export var dialogue_list_reject: DialogueList

##身份证
@export_category("IDCard")
@export var IDCard_ghostname: String
@export var IDCard_sex: String
@export var IDCard_country: String
@export var IDCard_deathday: String
@export var IDCard_birthday: String
@export var IDCard_nationality: String
@export var IDCard_id: String
@export var IDCard_avatar: Texture
##背面信息
@export var IDCard_Authority: String
@export var IDCard_ValidPeriod: String
@export var IDCard_logo: String

##轮回许可
@export_category("licence")
@export var licence_ghostname: String
@export var licence_sex: String
@export var licence_country: String
@export var licence_birthday: String
@export var licence_nationality: String
@export var licence_id: String

##通行证
@export_category("passport")
@export var passport_ghostname: String
@export var passport_place: String
@export var passport_Authority: String
@export var passport_ValidPeriod: String
@export var passport_id: String
@export var passport_inumber: String

##档案信息
@export_category("files_baseinfo")
@export var files_ghostname: String
@export var files_sex: String
@export var files_country: String
@export var files_deathday: String
@export var files_birthday: String
@export var files_nationality: String
@export var files_id: String
@export var files_job: String
@export var files_weight: String
@export var files_height: String
@export var files_religion: String

@export_category("files_death_reason")
@export var files_death_reason: String

@export_category("files_life_stories")
@export var files_life_stories: Array[String]

@export_category("files_evaluation")
@export var files_evaluation: Array[String]

@export_category("files_record")
@export var files_record: Array[String]

##申请表
@export_category("applay")
@export var applay: String
@export var father_name: String
@export var mather_name: String
@export var next_country: String
@export var event: BaseEvent

##资源
@export_category("resource")
@export var sprite_frames: SpriteFrames


##判断和通过影响
@export_category("passInfluence")
@export var is_can_pass: bool
@export var pass_influence: String
@export var refuse_influence: String
