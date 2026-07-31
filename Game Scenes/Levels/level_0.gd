extends Level

@export_category("Level Specifics")
@export var altmode1: Control
@export var altmode2: Control

func on_alt() -> void:
	viewport_signal.emit(2)
	
func _init(alt: int) -> void:
	if alt == 0:
		altmode1.visibility = true
		altmode2.visibility = false
	elif alt == 1:
		altmode1.visibility = false
		altmode2.visibility = true
	
