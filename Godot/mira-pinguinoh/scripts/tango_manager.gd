extends Node

var board = [
	[0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0],
	[2, 1, 0, 2, 2, 0],
	[1, 1, 0, 1, 2, 0]
]

var must_equal = [
	[[0, 1], [1, 1]],
	[[0, 2], [1, 2]],
	[[0, 4], [1, 4]],
	[[0, 5], [1, 5]]
]

var filled_cells = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.player_interaction.connect(on_player_interaction)
	light_suns_and_moons()
	
func on_player_interaction(i: int, j: int):
	if board[i][j] == 0:
		board[i][j] = 1
		filled_cells = filled_cells + 1
		SignalManager.light_interactable.emit(i, j, Color.YELLOW)
	elif board[i][j] == 1:
		board[i][j] = 2
		SignalManager.light_interactable.emit(i, j, Color.BLUE)
	else:
		board[i][j] = 0
		filled_cells = filled_cells - 1
		SignalManager.light_interactable.emit(i, j, Color.WHITE)
	
	light_suns_and_moons()
	
	var errors = all_invalid_cells()
	send_error_signal(errors)
	
	if filled_cells == 28 && len(errors) == 0:
		light_all_enbled(Color.DARK_RED)
		SignalManager.the_next_level.emit(5)

func all_invalid_cells():
	var invalid_cells = []
	
	for i in range(0, len(board)):
		for j in range(0, len(board[0])):
			if board[i][j]:
				check_equality_horizontal(i, invalid_cells)
				check_equality_vertical(j, invalid_cells)
				check_more_than_three_horizontal(i, invalid_cells)
				check_more_than_three_vertical(j, invalid_cells)
				check_must_equalities(invalid_cells)
	return invalid_cells

func check_equality_horizontal(i: int, errors: Array):
	var sun_count = 0
	var moon_count = 0
	
	for k in range(0, len(board)):
		if board[i][k] == 1:
			sun_count = sun_count + 1
		elif board[i][k] == 2:
			moon_count = moon_count + 1
	
	if sun_count + moon_count == len(board) && sun_count != moon_count:
		for k in range(0, len(board)):
			if !errors.any(func(error):
				return error[0] == i && error[1] == k
			):
				errors.append([i, k])

func check_equality_vertical(j: int, errors: Array):
	var sun_count = 0
	var moon_count = 0
	
	for k in range(0, len(board)):
		if board[k][j] == 1:
			sun_count = sun_count + 1
		elif board[k][j] == 2:
			moon_count = moon_count + 1
	
	if sun_count + moon_count == len(board) && sun_count != moon_count:
		for k in range(0, len(board)):
			if !errors.any(func(error):
				return error[0] == k && error[1] == j
			):
				errors.append([k, j])
	

func check_more_than_three_horizontal(i: int, errors: Array):
	var min_w = 0
	var max_w = 3
		
	for k in range(0, len(board) - max_w + 1):
		var sun_count = 0
		var moon_count = 0

		for w in range(min_w, max_w):
			if board[i][w] == 1:
				sun_count = sun_count + 1
			elif board[i][w] == 2:
				moon_count = moon_count + 1
		if sun_count == 3 || moon_count == 3:
			for w in range(min_w, max_w):
				if !errors.any(func(error):
					return error[0] == i && error[1] == w
				):
					errors.append([i, w])
		min_w = min_w + 1
		max_w = max_w + 1


func check_more_than_three_vertical(j: int, errors: Array):
	var min_w = 0
	var max_w = 3
		
	for k in range(0, len(board) - max_w + 1):
		var sun_count = 0
		var moon_count = 0

		for w in range(min_w, max_w):
			if board[w][j] == 1:
				sun_count = sun_count + 1
			elif board[w][j] == 2:
				moon_count = moon_count + 1
		if sun_count == 3 || moon_count == 3:
			for w in range(min_w, max_w):
				if !errors.any(func(error):
					return error[0] == w && error[1] == j
				):
					errors.append([w, j])
		min_w = min_w + 1
		max_w = max_w + 1

func check_must_equalities(errors: Array):
	for equality in must_equal:
		if (board[equality[0][0]][equality[0][1]]
				!= board[equality[1][0]][equality[1][1]]
			&& 	board[equality[0][0]][equality[0][1]] != 0
			&& 	board[equality[1][0]][equality[1][1]] != 0
		):
			if !errors.any(func(error):
				return (error[0] == equality[0][0] 
					&& error[1] == equality[0][1]
				)
			):
				errors.append([equality[0][0], equality[0][1]])
				
			if !errors.any(func(error):
				return (error[0] == equality[1][0] 
					&& error[1] == equality[1][1]
				)
			):
				errors.append([equality[1][0], equality[1][1]])

			

func send_error_signal(errors: Array):
	for error in errors:
		SignalManager.light_interactable.emit(error[0], error[1], Color.RED)

func light_suns_and_moons():
	for i in range(0, len(board)):
		for j in range(0, len(board[0])):
			if board[i][j] == 1:
				SignalManager.light_interactable.emit(i, j, Color.YELLOW)
			elif board[i][j] == 2:
				SignalManager.light_interactable.emit(i, j, Color.BLUE)

func light_all_enbled(color: Color):
	for i in range(0, len(board)):
		for j in range(0, len(board[0])):
			if board[i][j]:
				SignalManager.light_interactable.emit(i, j, color)
