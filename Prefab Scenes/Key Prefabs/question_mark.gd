extends Control

@export var camera: Camera2D
@export var pos_in_cam: Vector2 = Vector2(-180,-95)

@export var questionDatas: Array[QuestionData]

var locked = false
var shake_done = false
var mouse_in_range = false
var dragging = false

signal question_placed(id: int)
signal question_lifted(id: int)

func _process(delta: float) -> void:
	if locked and shake_done and mouse_in_range and Input.is_action_just_pressed("click"):
		unlock_question_mark()
	elif not locked and (mouse_in_range or dragging):
		if Input.is_action_pressed("click"):
			dragging = true
			global_position = get_global_mouse_position()
		if Input.is_action_just_released("click"):
			dragging = false
			var questionRect = get_global_rect()
			for data in questionDatas:
				var node1 = get_node(data.trigger1)
				var node2 = get_node(data.trigger2)
				var rect1 = node1.get_global_rect()
				var rect2 = node2.get_global_rect()
				if questionRect.intersects(rect1) and questionRect.intersects(rect2):
					reparent(get_tree().current_scene, true)
					shake_done = false
					locked = true
					question_placed.emit(data.id)
					await get_tree().create_timer(4).timeout
					shake_done = true
					
			
func unlock_question_mark() -> void:
	reparent(camera, true)
	position = pos_in_cam
	await get_tree().create_timer(0.1).timeout
	locked = false
					
		


func _on_mouse_entered() -> void:
	mouse_in_range = true 


func _on_mouse_exited() -> void:
	mouse_in_range = false
