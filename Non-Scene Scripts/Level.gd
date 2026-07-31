extends Node2D
class_name Level

@export var player: Node2D
@export var id: int = -1
@export var spawn_location: Marker2D
@export var backtrack_location: Marker2D

var alt = 0

signal viewport_signal(num: int)

func _init() -> void:
	pass

func _enter_tree() -> void:
	if global.latest_level < id:
		global.latest_level = id
	if global.current_level == id - 1 || global.current_level == -1:
		player.position = spawn_location.position
	else:
		player.position = backtrack_location.position
	global.current_level = id

func on_alt() -> void:
	pass
