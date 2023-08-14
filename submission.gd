extends Node

class_name Submission

@export var code: Array = []
@export var reds: int
@export var whites: int

func _init(cd: Array, num_reds: int = 0, num_whites: int = 0):
	self.code = cd
	self.reds = num_reds
	self.whites = num_whites
