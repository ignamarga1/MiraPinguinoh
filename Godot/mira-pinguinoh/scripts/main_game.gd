extends Node2D

#@onready var transitionScene : TransitionScene = $TransitionScene

@export var text : String = ""

var level = 0

var scenes: Array[PackedScene] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
