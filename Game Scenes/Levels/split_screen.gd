extends Node2D

@export var textures: Array[TextureRect]
@export var viewports: Array[SubViewport]
@export var screen_sizes: Array[Vector2] = [
	Vector2(1150,650),
	Vector2(548,550),
	Vector2(548,310),
	Vector2(548,310), ]
@export var screen_positions: Array[Vector2] = [
	Vector2(0,0),
	Vector2(16.67,50),
	Vector2(584.33,50),
	Vector2(19,10),
	Vector2(583,10),
	Vector2(322,330),
	Vector2(19,10),
	Vector2(583,10),
	Vector2(19,330),
	Vector2(583,330), ]

func _ready() -> void:
	set_screens(1)

func set_screens(amount: int) -> void:
	for i in range(0,amount):
		textures[i].visible = true
		textures[i].size = screen_sizes[amount-1]
		viewports[i].size = screen_sizes[amount-1]
		textures[i].position = screen_positions[summation(amount-1) + i]
	for i in range(amount, textures.size()):
		textures[i].visible = false

func summation(num: int) -> int:
	if(num == 0): return num
	return summation(num - 1) + num


func _on_viewport_signal(num: int, packed: PackedScene) -> void:
	set_screens(num) # Replace with function body.
	for i in range(1, num):
		var alt_level = packed.instantiate(i)
		alt_level.reparent(viewports[i])
		
		
