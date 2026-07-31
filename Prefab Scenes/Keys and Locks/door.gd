extends Node2D

func open_door() -> void:
	$CollisionShape2D.disabled = true
	modulate = Color(1,1,1,0.6)
func close_door() -> void:
	$CollisionShape2D.disabled = false
	modulate = Color(1,1,1,1)
