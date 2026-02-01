extends Node2D

@export var is_interactable = true

@export var i = 0
@export var j = 0
@export var indicator: Sprite2D
@export var quote: Sprite2D

var player_inside_interaction_area = false

func _ready() -> void:
	SignalManager.light_interactable.connect(light_indicator)
	SignalManager.light_all_interactables.connect(light_all_indicators)

func _process(delta: float) -> void:
	var interaction_pressed = Input.is_action_just_pressed("Interact")
	if interaction_pressed && player_inside_interaction_area && is_interactable:
		SignalManager.player_interaction.emit(i, j)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player && is_interactable:
		player_inside_interaction_area = true
		quote.visible = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player && is_interactable:
		player_inside_interaction_area = false
		quote.visible = false

func light_indicator(x: int, y: int, color: Color):
	if x == i && y == j:
		indicator.modulate = color

func light_all_indicators(color: Color):
	indicator.modulate = color
