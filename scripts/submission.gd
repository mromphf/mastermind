extends Node

class_name Submission

@export var code: Array = []
var reds: int
var whites: int


func cracked() -> bool:
	return reds == 4

func hints() -> Array:
	return range(reds).map(func(_x): return Code.Hints.RED) + \
		range(whites).map(func(_x): return Code.Hints.WHITE)

func _init(cd: Array, num_reds: int = 0, num_whites: int = 0):
	self.code = cd
	self.reds = num_reds
	self.whites = num_whites
