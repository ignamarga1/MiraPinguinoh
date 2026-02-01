extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		#$ColorRect2.modulate.a = 0.0
		pass


func _on_button_pressed() -> void:
	$AnimationPlayer.play('fade_show')
	await get_tree().create_timer(2.5).timeout
	get_tree().change_scene_to_file("res://scenes/transition_dialogue_1.tscn")
