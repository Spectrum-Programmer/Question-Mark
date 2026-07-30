@icon("res://Assets/Icons/MouseIcon.png")

extends Area2D
class_name Interactable
	
## Emitted when this entity is interacted with (player enters range and uses Mouse Button 1 Click)
signal interacted

## The entity is within the area of this interactable
var in_range = false;
	
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
# Check for if the player enters or leaves the range of the interactable
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		in_range = true 
func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_range = false  # Replace with function body.


# Check if the player enters the range of the interactable and clicks MB1
func _process(delta: float) -> void:
	if in_range and Input.is_action_just_pressed("click"):
		interacted.emit()
