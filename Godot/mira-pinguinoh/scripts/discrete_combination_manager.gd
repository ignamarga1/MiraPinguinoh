extends Node

var board = [[0, 0, 0, 0, 0]]

var combination = [[1, 0, 3, 2, 2]]
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
	SignalManager.light_interactable.emit(i, j, colors[board[i][j]])

	if board == combination:
		light_all_enbled(Color.PINK)

func light_all_enbled(color: Color):
	for i in range(0, len(board)):
		for j in range(0, len(board[0])):
			if board[i][j]:
				SignalManager.light_interactable.emit(i, j, color)
