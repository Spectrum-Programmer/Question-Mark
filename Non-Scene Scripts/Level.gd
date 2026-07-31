extends Node2D
class_name Level

@export var player: Player
@export var id: int = -1
@export var spawn_location: Marker2D
@export var backtrack_location: Marker2D

var start_mode = 0

var alt = 0

signal viewport_signal(num: int, scene: PackedScene)

func _init(alt: int) -> void:
	pass

func _enter_tree() -> void:
	if global.latest_level < id:
		global.latest_level = id
	if global.current_level == id - 1 || global.current_level == -1:
		player.position = spawn_location.position
	else:
		player.position = backtrack_location.position
	global.current_level = id

func on_alt(id: int) -> void:
	pass
	
func PackScene() -> PackedScene:
	var packed_scene = PackedScene.new()
	set_to_owner(self, self)
	packed_scene.pack(self)
	return packed_scene
	
func set_to_owner(root: Node, node: Node) -> void:
	for child in node.get_children():
		child.owner = root
		set_to_owner(root, child)
	
