extends Node2D

class_name Board

const MAX_ROUNDS = 10
var rnd = 1


func update(input, red, white):
	var target = $OutputHousing.get_children()[rnd - 1]
	target.render_submission(input)
	target.render_hints(red, white)
	
	rnd = rnd + 1 if rnd <= MAX_ROUNDS else MAX_ROUNDS

func _ready():
	pass
