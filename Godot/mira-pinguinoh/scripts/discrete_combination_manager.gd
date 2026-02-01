extends Node

var board = [[0, 0, 0, 0]]

var combination = [[2, 0, 3, 3]]
var limit = 4
var colors = [
	Color.WHITE,
	Color.LAWN_GREEN,
	Color.LIME_GREEN,
	Color.SEA_GREEN
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.player_interaction.connect(on_player_interaction)
	
func on_player_interaction(i: int, j: int):	
	board[i][j] = board[i][j] + 1
	if board[i][j] >= limit:
		board[i][j] = 0
	SignalManager.shift_tiles.emit(j)

	if board == combination:
		SignalManager.light_all_interactables.emit(Color.GREEN)
		SignalManager.the_next_level.emit(1)
		
