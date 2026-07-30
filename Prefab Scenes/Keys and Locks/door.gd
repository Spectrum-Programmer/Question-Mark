extends StaticBody2D

@export var required_levers = 1
var pulled_levers = []
var num_levers = 0

func _ready() -> void:
	close_door()

func _on_lever_pulled(id: int) -> void:
	if not id in pulled_levers:
		num_levers+=1
		pulled_levers.append(id)
		if num_levers == required_levers:
			open_door()
	else:
		num_levers-=1
		pulled_levers.erase(id)
		if num_levers < required_levers:
			close_door()

# Disable and re-enable collisions to open and close the door
func open_door() -> void:
	$CollisionShape2D.disabled = true
	modulate = Color(1,1,1,0.6)
func close_door() -> void:
	$CollisionShape2D.disabled = false
	modulate = Color(1,1,1,1)
