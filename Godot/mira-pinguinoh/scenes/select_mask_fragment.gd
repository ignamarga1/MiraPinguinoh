extends Node2D

const composition_fragments = preload("res://scripts/composition_fragments.gd")
var mask = preload("res://scenes/mask.tscn")

@onready var option_1: Sprite2D = $Option1
@onready var option_2: Sprite2D = $Option2
@onready var option_3: Sprite2D = $Option3
var mask_options : Array[int] = [1,2,3,4,5]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_mask_options()
	show_mask_options()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func generate_mask_options() -> void:
	mask_options.shuffle()
	print(mask_options)	
	
	mask_options.resize(3)
	print(mask_options)	
	
func show_mask_options() -> void:
	option_1.texture = composition_fragments.mask_fragment1_spritesheet[mask_options[0]]
	option_2.texture = composition_fragments.mask_fragment1_spritesheet[mask_options[1]]
	option_3.texture = composition_fragments.mask_fragment1_spritesheet[mask_options[2]]

#func select_option():

#func update_current_mask_options(update : Array[Sprite2D]) -> void:
	#mask.mask_fragment_id_1 = 
