extends Node

var board = [
	[false, false, false, false, false],
	[false, false, false, false, false],
	[false, false, false, false, false],
	[false, false, false, false, false],
	[false, false, false, false, false]
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.panel_steped.connect(on_panel_step)
	SignalManager.light_all_panels.emit(Color.BLUE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_panel_step(i:int, j:int):
	if board[i][j]:
		board[i][j] = false
		SignalManager.light_panel.emit(i, j, Color.BLUE)
	else:
		board[i][j] = true
		SignalManager.light_panel.emit(i, j, Color.YELLOW)
		
	if panels_complete():
		SignalManager.light_all_panels.emit(Color.GREEN)
		

func panels_complete():
	var result = true
	for i in range(0, len(board)):
		for j in range(0, len(board)):
			if !board[i][j]:
				result = false
	return result
