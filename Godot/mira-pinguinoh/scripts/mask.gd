extends Node2D

const composition_fragments = preload("res://scripts/composition_fragments.gd")

@onready var mask_fragment_0: Sprite2D = $CompositionFragments/MaskFragment1
@onready var mask_fragment_1: Sprite2D = $CompositionFragments/MaskFragment2
@onready var mask_fragment_2: Sprite2D = $CompositionFragments/MaskFragment3
@onready var mask_fragment_3: Sprite2D = $CompositionFragments/MaskFragment4
@onready var mask_fragment_4: Sprite2D = $CompositionFragments/MaskFragment5

@export var mask_fragment_id_0 : int = 0
@export var mask_fragment_id_1 : int = 0
@export var mask_fragment_id_2 : int = 0
@export var mask_fragment_id_3 : int = 0
@export var mask_fragment_id_4 : int = 0

@export var level : int = 0
var selected = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mask_fragment_0.texture = composition_fragments.mask_fragments[0][mask_fragment_id_0]
	mask_fragment_1.texture = composition_fragments.mask_fragments[1][mask_fragment_id_1]
	mask_fragment_2.texture = composition_fragments.mask_fragments[2][mask_fragment_id_2]
	mask_fragment_3.texture = composition_fragments.mask_fragments[3][mask_fragment_id_3]
	mask_fragment_4.texture = composition_fragments.mask_fragments[4][mask_fragment_id_4]
	
func make_visible() -> void:
	visible = true
	
func increment_level_number() -> void:
	level += 1
	
func update_fragment_id(selected_option : int) -> void:
	match level:
		0 : mask_fragment_id_0 = selected_option
		1 : mask_fragment_id_1 = selected_option
		2 : mask_fragment_id_2 = selected_option
		3 : mask_fragment_id_3 = selected_option
		4 : mask_fragment_id_4 = selected_option

func update_mask_visibility() -> void:
	match level:
		0 : 
			mask_fragment_0.visible = true
			await get_tree().create_timer(1).timeout
			get_tree().change_scene_to_file("res://scenes/transition_dialogue_2.tscn")
		1 : 
			mask_fragment_1.visible = true
			get_tree().change_scene_to_file("res://scenes/transition_dialogue_3.tscn")
			await get_tree().create_timer(1).timeout
		2 : 
			mask_fragment_2.visible = true
			get_tree().change_scene_to_file("res://scenes/transition_dialogue_4.tscn")
			await get_tree().create_timer(1).timeout
		3 : 
			mask_fragment_3.visible = true
			get_tree().change_scene_to_file("res://scenes/transition_dialogue_5.tscn")		
			await get_tree().create_timer(1).timeout
		4 : 
			mask_fragment_4.visible = true
			get_tree().change_scene_to_file("res://scenes/transition_dialogue_6.tscn")
			await get_tree().create_timer(1).timeout

