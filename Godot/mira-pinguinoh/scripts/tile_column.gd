extends Node2D

@export var tile1: Sprite2D
@export var tile2: Sprite2D
@export var tile3: Sprite2D
@export var tile4: Sprite2D

@export var column_number = 0

@export var texture1: Texture2D
@export var texture2: Texture2D
@export var texture3: Texture2D
@export var texture4: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.shift_tiles.connect(on_shift_tiles)
	tile1.texture = texture1
	tile2.texture = texture2
	tile3.texture = texture3
	tile4.texture = texture4

func on_shift_tiles(i: int):
	if i == column_number:
		var tile4aux = tile4.texture		
		tile4.texture = tile3.texture
		tile3.texture = tile2.texture
		tile2.texture = tile1.texture
		tile1.texture = tile4aux
