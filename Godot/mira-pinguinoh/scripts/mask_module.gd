extends Node2D

@onready var frente: Sprite2D = $Frente
@onready var ojos: Sprite2D = $Ojos
@onready var mofletes: Sprite2D = $Mofletes
@onready var nariz: Sprite2D = $Nariz
@onready var boca: Sprite2D = $Boca


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var fragments_id = MaskManager.get_mask_fragments()
	
	frente.texture = Mask.composition_fragments.mask_fragments[0][fragments_id[0]]
	ojos.texture = Mask.composition_fragments.mask_fragments[1][fragments_id[1]]
	mofletes.texture = Mask.composition_fragments.mask_fragments[2][fragments_id[2]]
	nariz.texture = Mask.composition_fragments.mask_fragments[3][fragments_id[3]]
	boca.texture = Mask.composition_fragments.mask_fragments[4][fragments_id[4]]
	
func make_invisible() -> void:
	visible = false
