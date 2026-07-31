extends Camera2D

@export var player: Node2D
@export var yOffset: int

var shake_camera = false
var shake_angle = 0;
var shake_speed = 5;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = player.global_position - Vector2(0,yOffset) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not shake_camera:
		position = player.global_position - Vector2(0,yOffset)
	else:
		position += Vector2(sin(shake_angle), cos(shake_angle)) * shake_speed


func camera_shake(time: int) -> void:
	shake_camera = true
	var timer = 0
	while(timer < time):		
		shake_angle = randi_range(0,359)
		await get_tree().create_timer(0.1).timeout
		shake_speed *= -1
		await get_tree().create_timer(0.1).timeout
		shake_speed *= -1
		timer += 0.2
	shake_camera = false
