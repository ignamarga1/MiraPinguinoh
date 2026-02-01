extends Node2D

@export var tile1: Sprite2D
@export var tile2: Sprite2D
@export var tile3: Sprite2D
@export var tile4: Sprite2D

@export var column_number = 0

var colors = [
	Color(0, 1, 1, 1),
	Color(1, 0, 1, 1),
	Color(1, 1, 0, 1),
	Color(1, 1, 1, 1)
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.shift_tiles.connect(on_shift_tiles)


func on_shift_tiles(i: int):
	if i == column_number:
		var tile4aux = tile4.modulate		
		tile4.modulate = tile3.modulate
		tile3.modulate = tile2.modulate
		tile2.modulate = tile1.modulate
		tile1.modulate = tile4aux
