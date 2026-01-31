extends Node

@export var i = 0
@export var j = 0
@export var sprite: Sprite2D

func _ready() -> void:
	SignalManager.light_panel.connect(on_light_panel)
	SignalManager.light_all_panels.connect(on_light_all_panels)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func on_light_panel(x: int, y: int, color: Color):
	if x == i && y == j:
		sprite.modulate = color
		

func on_light_all_panels(color: Color):
	sprite.modulate = color


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("Jugdor entró en mí")
		SignalManager.panel_steped.emit(i, j)
