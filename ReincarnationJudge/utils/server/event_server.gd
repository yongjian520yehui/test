extends Node


const NEWS_EVENT = preload("res://utils/event/news_event.tscn")
const REQUEST_EVENT = preload("res://utils/event/request_event.tscn")

signal event_started()


func get_event_data(type: String):
	var event
	match  type:
		"news":
			event = NEWS_EVENT.instantiate()
			var loaded_resource := ResourceLoader.load("res://utils/event/news_event1.tres")
			event.event = loaded_resource
		"request":
			event = REQUEST_EVENT.instantiate()
			var loaded_resource := ResourceLoader.load("res://utils/event/request_event1.tres")
			event.event = loaded_resource
	return event
