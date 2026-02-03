class_name Player
extends CharacterBody2D

@onready var animation = $Sprite2D/AnimationPlayer

@export var speed = 300.0

func _ready() -> void:
	animation.play("player")

func _physics_process(delta: float) -> void:

	var h_direction := Input.get_axis("left", "right")
	if h_direction:
		velocity.x = h_direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	var v_direction := Input.get_axis("up", "down")
	if v_direction:
		velocity.y = v_direction * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()
