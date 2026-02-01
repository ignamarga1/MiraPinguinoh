extends Node2D

const composition_fragments = preload("res://scripts/composition_fragments.gd")

@onready var button_1: Button = $Button1
@onready var button_2: Button = $Button2
@onready var button_3: Button = $Button3

@onready var mask_bg: Sprite2D = $MaskBg

var sprite_button_1 : Sprite2D
var sprite_button_2 : Sprite2D
var sprite_button_3 : Sprite2D

var mask_options : Array[int] = [0,1,2,3,4]
var selected_option : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	change_bg_color()
	Mask.make_visible()
	
	sprite_button_1 = button_1.get_child(0)
	sprite_button_2 = button_2.get_child(0)
	sprite_button_3 = button_3.get_child(0)
	
	generate_mask_options()
	$AnimationPlayer.play("text_show")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	show_mask_options()

func generate_mask_options() -> void:
	mask_options.shuffle()
	print(mask_options)
	
	mask_options.resize(3)
	print(mask_options)
	
func show_mask_options() -> void:
	sprite_button_1.texture = composition_fragments.mask_fragments[Mask.level][mask_options[0]]
	sprite_button_2.texture = composition_fragments.mask_fragments[Mask.level][mask_options[1]]
	sprite_button_3.texture = composition_fragments.mask_fragments[Mask.level][mask_options[2]]

func _on_button_1_button_down() -> void:
	selected_option = mask_options[0]; 
	print(selected_option)
	update_current_mask_option();

func _on_button_2_button_down() -> void:
	selected_option = mask_options[1]
	print(selected_option)
	update_current_mask_option()

func _on_button_3_button_down() -> void:
	selected_option = mask_options[2]
	print(selected_option)
	update_current_mask_option()
	
func update_current_mask_option() -> void:
	Mask.update_fragment_id(selected_option)
	Mask.update_mask_visibility()
	
	print('New mask selected')

func change_bg_color() -> void:
	#verde, azul, amarillo, lila, rojo
	match Mask.level:
		0 : mask_bg.modulate = Color(Color.GREEN)
		1 : mask_bg.modulate = Color(Color.BLUE)
		2 : mask_bg.modulate = Color(Color.YELLOW)
		3 : mask_bg.modulate = Color(Color.VIOLET)
		4 : mask_bg.modulate = Color(Color.RED)
