extends Resource
class_name GhostResource

##对话
@export var dialogue_list_before: DialogueList
@export var dialogue_list_ask: DialogueList
@export var dialogue_list_after: DialogueList

##信息资料
@export var book: Dictionary
@export var event: BaseEvent
@export var applay: Dictionary

##资源
@export var sprite_frames: SpriteFrames

##判断和通过影响
@export var is_can_pass: bool
@export var influence: String
