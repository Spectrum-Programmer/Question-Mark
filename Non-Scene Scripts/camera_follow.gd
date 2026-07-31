extends Camera2D

@export var player: Node2D
@export var yOffset: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = player.global_position - Vector2(0,yOffset) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position = player.global_position - Vector2(0,yOffset)
