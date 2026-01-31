extends Node2D

const composition_fragments = preload("res://scripts/composition_fragments.gd")

@onready var mask_fragment_1: Sprite2D = $CompositionFragments/MaskFragment1
@onready var mask_fragment_2: Sprite2D = $CompositionFragments/MaskFragment2
@onready var mask_fragment_3: Sprite2D = $CompositionFragments/MaskFragment3
@onready var mask_fragment_4: Sprite2D = $CompositionFragments/MaskFragment4
@onready var mask_fragment_5: Sprite2D = $CompositionFragments/MaskFragment5

@export var mask_fragment_id_1 : int = 0
@export var mask_fragment_id_2 : int = 0
@export var mask_fragment_id_3 : int = 0
@export var mask_fragment_id_4 : int = 0
@export var mask_fragment_id_5 : int = 0
@export var mask_fragments : Array[int] = [mask_fragment_id_1, mask_fragment_id_2, mask_fragment_id_3, mask_fragment_id_4, mask_fragment_id_5]
@export var current_mask_fragments_sprite : Array[Sprite2D] = [mask_fragment_1, mask_fragment_2, mask_fragment_3, mask_fragment_4, mask_fragment_5]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mask_fragment_1.texture = composition_fragments.mask_fragment1_spritesheet[mask_fragment_id_1]
	mask_fragment_2.texture = composition_fragments.mask_fragment2_spritesheet[mask_fragment_id_2]
	mask_fragment_3.texture = composition_fragments.mask_fragment3_spritesheet[mask_fragment_id_3]
	mask_fragment_4.texture = composition_fragments.mask_fragment4_spritesheet[mask_fragment_id_4]
	mask_fragment_5.texture = composition_fragments.mask_fragment5_spritesheet[mask_fragment_id_5]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
