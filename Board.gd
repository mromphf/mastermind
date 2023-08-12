extends Node2D

class_name Board

var rnd = 1
var round_map = {}

func update(input):
	round_map.get(rnd, round_map[2]).render_submission(input)
	rnd += 1

func _ready():
	round_map = {
		1: $OutputHousing/output1,
		2: $OutputHousing/output2
	}	
