extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Mask.make_visible()
	$MarginContainer/VBoxContainer/MarginContainer/AnimationPlayer.play('show_text')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_yes_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/yes_choosing.tscn")



func _on_button_no_pressed() -> void:
	pass # Replace with function body.
