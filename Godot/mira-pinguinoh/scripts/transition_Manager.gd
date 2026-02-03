extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.the_next_level.connect(go_to_level)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func go_to_level(n_level:int):
	await get_tree().create_timer(1).timeout
	if(n_level !=1):
		Mask.increment_level_number()
	get_tree().change_scene_to_file("res://scenes/select_mask_fragment.tscn")
	
