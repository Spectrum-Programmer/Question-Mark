extends Area2D

@export_enum("Prev", "Next") var destination: int
@export var scene_id: int

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		
		
		
		var levels = global.levels
		
		var packed_scene = PackedScene.new()
		var root = get_tree().current_scene
		set_to_owner(root, root)
		packed_scene.pack(root)
		global.levels[scene_id] = packed_scene
		
		var index : int
		if destination == 0:
			index = scene_id - 1
		else: index = scene_id + 1
		if index + 1 <= levels.size() and levels[index]:
			get_tree().change_scene_to_packed.call_deferred(levels[index])
		else:
			get_tree().change_scene_to_file.call_deferred(
				"res://Game Scenes/Levels/Level " 
				+ str(index)
				+ ".tscn"
			)
		print(global.levels)
			
func set_to_owner(root: Node, node: Node) -> void:
	for child in node.get_children():
		child.owner = root
		set_to_owner(root, child)
