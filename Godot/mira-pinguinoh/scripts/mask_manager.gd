extends Node

var mask_fragments = [0, 2, 3, 4, 0]

func add_mask_fragment(i: int, id: int):
	mask_fragments[Mask.level] = id

func get_mask_fragments():
	return mask_fragments
