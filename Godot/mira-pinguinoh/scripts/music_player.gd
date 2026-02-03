extends Node2D

var music
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.the_next_level.connect(play_victory)
	music = $AudioStreamPlayer2D
	music.play()

func play_aux():
	$AudioStreamPlayer2D.play()

func stop():
	$AudioStreamPlayer2D.stop()
	
func play_victory(n):
	$WinSound.play()
