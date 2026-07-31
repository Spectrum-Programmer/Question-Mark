extends Level

@export_category("Level Specifics")
@export var altmode1: Control
@export var altmode2: Control

func on_alt(id: int) -> void:
	await get_tree().create_timer(4).timeout
	var packed = PackScene()
	viewport_signal.emit(2, packed)

	
func _init(alt: int = 0) -> void:
	start_mode = alt

func _ready() -> void:
	if start_mode == 0:
		altmode1.visible = true
		altmode2.visible = false
		player.set_alt(false)
	elif start_mode == 1:
		altmode1.visible = false
		altmode2.visible = true
		player.set_alt(true)
	
