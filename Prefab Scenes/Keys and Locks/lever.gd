extends Node2D

@export var id = -1

## Emitted when the lever is interacted with (player enters range and uses Mouse Button 1 Click)
signal pull_lever(id: int)

func _on_interactable_interacted() -> void:
	pull_lever.emit(id) 
