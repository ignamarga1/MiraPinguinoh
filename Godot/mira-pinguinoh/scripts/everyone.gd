extends Node2D

@export var frentes: Sprite2D
@export var ojos: Sprite2D
@export var mofletes: Sprite2D
@export var narices: Sprite2D
@export var bocas: Sprite2D

var mask_fragments = [
	[
		preload("res://assets/everyone/frentes/mask_0_1.png"),
		preload("res://assets/everyone/frentes/mask_0_2.png"),
		preload("res://assets/everyone/frentes/mask_0_3.png"),
		preload("res://assets/everyone/frentes/mask_0_4.png"),
		preload("res://assets/mask/mask_fragment_0/mask_0_5.png")
	],
	[
		preload("res://assets/everyone/ojos/mask_1_1.png"),
		preload("res://assets/everyone/ojos/mask_1_2.png"),
		preload("res://assets/everyone/ojos/mask_1_3.png"),
		preload("res://assets/everyone/ojos/mask_1_4.png"),
		preload("res://assets/everyone/ojos/mask_1_5.png"),
	],
	[
		preload("res://assets/everyone/coloretes/mask_2_1.png"),
		preload("res://assets/everyone/coloretes/mask_2_2.png"),
		preload("res://assets/everyone/coloretes/mask_2_3.png"),
		preload("res://assets/everyone/coloretes/mask_2_4.png"),
		preload("res://assets/everyone/coloretes/mask_2_5.png"),
	],
	[
		preload("res://assets/everyone/narices/mask_3_1.png"),
		preload("res://assets/everyone/narices/mask_3_2.png"),
		preload("res://assets/everyone/narices/mask_3_3.png"),
		preload("res://assets/everyone/narices/mask_3_4.png"),
		preload("res://assets/everyone/narices/mask_3_5.png"),
	],
	[
		preload("res://assets/everyone/bocas/mask_4_1.png"),
		preload("res://assets/everyone/bocas/mask_4_2.png"),
		preload("res://assets/everyone/bocas/mask_4_3.png"),
		preload("res://assets/everyone/bocas/mask_4_4.png"),
		preload("res://assets/everyone/bocas/mask_4_5.png"),
	]
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var fragments = MaskManager.get_mask_fragments()
	frentes.texture = mask_fragments[0][fragments[0]]
	ojos.texture = mask_fragments[1][fragments[1]]
	mofletes.texture = mask_fragments[2][fragments[2]]
	narices.texture = mask_fragments[3][fragments[3]]
	bocas.texture = mask_fragments[4][fragments[4]]
	
	$AnimationPlayer.play("show_fade")
	
	await get_tree().create_timer(8).timeout
	get_tree().change_scene_to_file("res://scenes/choosing.tscn")
