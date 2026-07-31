extends Control

@export var camera: Camera2D
@export var pos_in_cam: Vector2 = Vector2(-180,-95)

@export var questionDatas: Array[QuestionData]

var locked = false
var shake_done = false
var grab_locked = false

signal question_placed(id: int)
signal question_lifted(id: int)

func _process(delta: float) -> void:
	if locked and shake_done and Input.is_action_just_pressed("click"):
		grab_locked = true
		unlock_question_mark()
		await get_tree().create_timer(0.1).timeout
		grab_locked = false
	elif not locked and not grab_locked:
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position()
		if Input.is_action_just_released("click"):
			var questionRect = get_child(0).get_global_rect()
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
	locked = false
					
		
