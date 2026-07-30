extends Interactable
class_name Collectible

signal collected

func _process(delta: float) -> void:
	if in_range and Input.is_action_just_pressed("right_click"):
		collect()

func collect() -> void:
	collected.emit()
	queue_free()
