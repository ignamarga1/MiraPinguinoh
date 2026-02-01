extends Node

var board = [[false, false, false, false, false]]

var combination = [[false, true, false, true, true]]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.player_interaction.connect(on_player_interaction)
	
func on_player_interaction(i: int, j: int):
	if board[i][j]:
		board[i][j] = false
		SignalManager.light_interactable.emit(i, j, Color.WHITE)
	else:
		board[i][j] = true
		SignalManager.light_interactable.emit(i, j, Color.GREEN)

	if board == combination:
		light_all_enbled(Color.PINK)

func light_all_enbled(color: Color):
	for i in range(0, len(board)):
		for j in range(0, len(board[0])):
			if board[i][j]:
				SignalManager.light_interactable.emit(i, j, color)
