class_name Player
extends CharacterBody2D

@export var speed = 300.0

func _physics_process(delta: float) -> void:

	var h_direction := Input.get_axis("ui_left", "ui_right")
	if h_direction:
		velocity.x = h_direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	var v_direction := Input.get_axis("ui_up", "ui_down")
	if v_direction:
		velocity.y = v_direction * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()
