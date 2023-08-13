extends Node2D

class_name Board

func reset():
	for node in $OutputHousing.get_children():
		node.reset()

func update(round, input, red, white):
	var target = $OutputHousing.get_children()[max(0, round - 1)]
	target.render_submission(input)
	target.render_hints(red, white)

func _ready():
	pass
