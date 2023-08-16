extends Node2D

var inputs = {}



func render_submission(submission):
	for idx in inputs.keys():
		inputs[idx].set_texture(Code.image_map[submission[idx]])


func render_hints(red: int, white: int):
	var reds = range(red).map(func(_x): return Code.Hints.RED)
	var whites = range(white).map(func(_x): return Code.Hints.WHITE)

	$Hints.render(reds + whites)


func reset():
	for ipt in inputs.values():
		ipt.set_texture(Code.EMPTY_BOX)

	$Hints.reset()

func _ready():
	inputs = {
		0: $Input/Box1,
		1: $Input/Box2,
		2: $Input/Box3,
		3: $Input/Box4
	}
