@icon("res://Assets/Icons/MouseIcon.png")

extends Area2D
class_name Interactable
	
signal interacted
	
func on_interact() -> void:
	interacted.emit()
	
