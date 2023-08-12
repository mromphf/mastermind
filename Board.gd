extends Node2D

class_name Board

const MAX_ROUNDS = 10
var rnd = 1


func update(input):
	$OutputHousing.get_children()[rnd - 1] \
		.render_submission(input)
	rnd = rnd + 1 if rnd <= MAX_ROUNDS else MAX_ROUNDS

func _ready():
	pass
