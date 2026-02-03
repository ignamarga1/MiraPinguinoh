extends Node

var board = [
	[false, false, false, false, false],
	[false, false, false, false, false],
	[false, false, false, false, false],
	[false, false, false, false, false],
	[false, false, false, false, false]
]

var queens_true = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.player_interaction.connect(on_player_interaction)
	SignalManager.light_all_interactables.emit(Color.DIM_GRAY)
	
func on_player_interaction(i: int, j: int):
	if board[i][j]:
		board[i][j] = false
		queens_true = queens_true - 1
		SignalManager.light_interactable.emit(i, j, Color.DIM_GRAY)
		light_all_enbled(Color.GREEN)
	else:
		board[i][j] = true
		queens_true = queens_true + 1
		SignalManager.light_interactable.emit(i, j, Color.GREEN)
	
	var errors = all_invalid_queens()
	send_error_signal(errors)
	
	if queens_true == 5 && len(errors) == 0:
		light_all_enbled(Color.PURPLE)
		SignalManager.the_next_level.emit(4)


func all_invalid_queens():
	var invalid_queens = []
	
	for i in range(0, len(board)):
		for j in range(0, len(board[0])):
			if board[i][j]:
				column_invalid_queens(i, j, invalid_queens)
				row_invalid_queens(i, j, invalid_queens)
				upper_right_diagonal_invalid_queens(i, j, invalid_queens)
				upper_left_diagonal_invalid_queens(i, j, invalid_queens)
				down_left_diagonal_invalid_queens(i, j, invalid_queens)
				down_right_diagonal_invalid_queens(i, j, invalid_queens)
	return invalid_queens


func send_error_signal(errors: Array):
	for error in errors:
		SignalManager.light_interactable.emit(error[0], error[1], Color.RED)


func light_all_enbled(color: Color):
	for i in range(0, len(board)):
		for j in range(0, len(board[0])):
			if board[i][j]:
				SignalManager.light_interactable.emit(i, j, color)


func column_invalid_queens(i: int, j: int, errors: Array):
	for k in range(0, len(board[0])):
		if board[k][j] && k != i && !errors.any(func(error):
			return error[0] == k && error[1] == j	
		):
			errors.append([k, j])


func row_invalid_queens(i: int, j: int, errors: Array):
	for k in range(0, len(board)):
		if board[i][k] && k != j && !errors.any(func(error):
			return error[0] == i && error[1] == k	
		):
			errors.append([i, k])


func upper_right_diagonal_invalid_queens(x: int, y: int, errors: Array):	
	var i = x + 1
	var j = y + 1
	
	while i < len(board) && j < len(board):
		if board[i][j] && !errors.any(func(error):
			return error[0] == i && error[1] == j
		):
			errors.append([i, j])
		i = i + 1
		j = j + 1


func upper_left_diagonal_invalid_queens(x: int, y: int, errors: Array):	
	var i = x - 1
	var j = y + 1
	
	while i >= 0 && j < len(board):
		if board[i][j] && !errors.any(func(error):
			return error[0] == i && error[1] == j
		):
			errors.append([i, j])
		i = i - 1
		j = j + 1


func down_left_diagonal_invalid_queens(x: int, y: int, errors: Array):
	var i = x - 1
	var j = y - 1
	
	while i >= 0 && j >= 0:
		if board[i][j] && !errors.any(func(error):
			return error[0] == i && error[1] == j
		):
			errors.append([i, j])
		i = i - 1
		j = j - 1
		

func down_right_diagonal_invalid_queens(x: int, y: int, errors: Array):	
	var i = x + 1
	var j = y - 1
	
	while i < len(board) && j >= 0:
		if board[i][j] && !errors.any(func(error):
			return error[0] == i && error[1] == j
		):
			errors.append([i, j])
		i = i + 1
		j = j - 1
		
