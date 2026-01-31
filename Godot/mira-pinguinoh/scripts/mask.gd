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
#@export var mask_fragments : Array[int] = [mask_fragment_id_1, mask_fragment_id_2, mask_fragment_id_3, mask_fragment_id_4, mask_fragment_id_5]
#@export var current_mask_fragments_sprite : Array[Sprite2D] = [mask_fragment_1, mask_fragment_2, mask_fragment_3, mask_fragment_4, mask_fragment_5]

@export var level : int = 4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mask_fragment_1.texture = composition_fragments.mask_fragments[0][mask_fragment_id_1]
	mask_fragment_2.texture = composition_fragments.mask_fragments[1][mask_fragment_id_2]
	mask_fragment_3.texture = composition_fragments.mask_fragments[2][mask_fragment_id_3]
	mask_fragment_4.texture = composition_fragments.mask_fragments[3][mask_fragment_id_4]
	mask_fragment_5.texture = composition_fragments.mask_fragments[4][mask_fragment_id_5]
	
func make_visible() -> void:
	visible = true
	
func increment_level_number() -> void:
	level += 1
	
func update_fragment_id(selected_option : int) -> void:
	#mask_fragments[level] = selected_option
	match level:
		0 : mask_fragment_id_1 = selected_option
		1 : mask_fragment_id_2 = selected_option
		2 : mask_fragment_id_3 = selected_option
		3 : mask_fragment_id_4 = selected_option
		4 : mask_fragment_id_5 = selected_option
		
