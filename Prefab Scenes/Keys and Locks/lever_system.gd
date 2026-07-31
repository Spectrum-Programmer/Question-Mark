extends Node2D

@export var required_levers = 1
var pulled_levers = []
var num_levers = 0

signal activate
signal deactivate

func _on_lever_pulled(id: int) -> void:
	if not id in pulled_levers:
		num_levers+=1
		pulled_levers.append(id)
		if num_levers == required_levers:
			activate.emit()
	else:
		num_levers-=1
		pulled_levers.erase(id)
		if num_levers < required_levers:
			deactivate.emit()
