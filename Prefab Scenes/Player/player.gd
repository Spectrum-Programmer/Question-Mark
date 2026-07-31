extends CharacterBody2D
class_name Player

@export var speed = 150
@export var jump_power = 300

var alt = false

# Every physics frame, check for different movement events
func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	walk() 
	jump()
	move_and_slide() # Apply the final velocity


## ----------------------------- ##
##       Movement Events         ##
## ----------------------------- ##

## If the player is not on the ground, constantly apply the downward force of gravity onto the player
func apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity -= -get_gravity() * delta

## If the walk_left ("A") or walk_right ("D") keys are pressed, walk in that direction
func walk() -> void:
	velocity.x = 0
	$AnimatedSprite2D.play()
	if not alt:
		if(Input.is_action_pressed("walk_left")): 
			velocity.x = -speed
			$AnimatedSprite2D.flip_h = true
		elif(Input.is_action_pressed("walk_right")): 
			velocity.x = speed
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.stop()
	else:
		if(Input.is_action_pressed("walk_left_alt")): 
			velocity.x = -speed
			$AnimatedSprite2D.flip_h = true
		elif(Input.is_action_pressed("walk_right_alt")): 
			velocity.x = speed
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.stop()

## If the jump ("W") key is pressed, and the player is on the ground, apply an upward velocity
func jump() -> void:
	if not alt:
		if(Input.is_action_just_pressed("jump") and is_on_floor()):
			velocity.y = -jump_power
	else:
		if(Input.is_action_just_pressed("jump_alt") and is_on_floor()):
			velocity.y = -jump_power
	
func set_alt(altMove: bool) -> void:
	alt = altMove
