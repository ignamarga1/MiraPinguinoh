extends Node2D

@export var frentes: Sprite2D
@export var ojos: Sprite2D
@export var mofletes: Sprite2D
@export var narices: Sprite2D
@export var bocas: Sprite2D

var mask_fragments = [
	[
		preload("res://assets/everyone/ojos/ojos1.png"),
		preload("res://assets/everyone/ojos/ojos2.png"),
		preload("res://assets/everyone/ojos/ojos3.png"),
		preload("res://assets/everyone/ojos/ojos4.png"),
		preload("res://assets/everyone/ojos/ojos5.png")
	],
	[
		preload("res://assets/everyone/ojos/ojos1.png"),
		preload("res://assets/everyone/ojos/ojos2.png"),
		preload("res://assets/everyone/ojos/ojos3.png"),
		preload("res://assets/everyone/ojos/ojos4.png"),
		preload("res://assets/everyone/ojos/ojos5.png")
	],
	[
		preload("res://assets/everyone/narices/nariz1.png"),
		preload("res://assets/everyone/narices/nariz2.png"),
		preload("res://assets/everyone/narices/nariz3.png"),
		preload("res://assets/everyone/narices/nariz4.png"),
		preload("res://assets/everyone/narices/nariz5.png")
	],
	[
		preload("res://assets/everyone/narices/nariz1.png"),
		preload("res://assets/everyone/narices/nariz2.png"),
		preload("res://assets/everyone/narices/nariz3.png"),
		preload("res://assets/everyone/narices/nariz4.png"),
		preload("res://assets/everyone/narices/nariz5.png")
	],
	[
		preload("res://assets/everyone/bocas/boca1 base.png"),
		preload("res://assets/everyone/bocas/boca2 base.png"),
		preload("res://assets/everyone/bocas/boca3 base .png"),
		preload("res://assets/everyone/bocas/boca4 base.png"),
		preload("res://assets/everyone/bocas/boca5base.png")
	]
]

var can_continue = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var fragments = MaskManager.get_mask_fragments()
	frentes.texture = mask_fragments[0][fragments[0]]
	ojos.texture = mask_fragments[1][fragments[1]]
	mofletes.texture = mask_fragments[2][fragments[2]]
	narices.texture = mask_fragments[3][fragments[3]]
	bocas.texture = mask_fragments[4][fragments[4]]
	
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://scenes/choosing.tscn")
	can_continue = true
