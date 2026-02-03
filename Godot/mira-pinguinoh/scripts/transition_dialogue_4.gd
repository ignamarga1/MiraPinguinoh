extends Node2D

@export var text: Array[String]
var currentText: String
var textIndex
@onready var txt_lbl : Label = $MarginContainer/HBoxContainer/TextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentText = text[0]
	textIndex = 0
	set_text(currentText)
	$MarginContainer/HBoxContainer/AnimationPlayer.play('text_show')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (textIndex < text.size()) && (text.size() > 0) && (Input.is_action_just_pressed("ui_accept")) :
		print('click')
		textIndex += 1
		if (textIndex < text.size()) :
			currentText = text[textIndex]
			set_text(currentText)
			$MarginContainer/HBoxContainer/AnimationPlayer.play("text_show")
	if textIndex == text.size():
		get_tree().change_scene_to_file("res://scenes/levels/level_queens.tscn")
			
func set_text(text: String):
	txt_lbl.set_text(text)
