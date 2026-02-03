extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MarginContainer/VBoxContainer/MarginContainer/AnimationPlayer.play("show_text")
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		pass
