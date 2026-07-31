extends Control

func _on_sign_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		visible = true

func _on_close_sign_button_button_down() -> void:
	visible = false # Replace with function body.
