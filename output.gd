extends Node2D

var inputs = {}

func render_submission(submission):
	for idx in inputs.keys():
		inputs[idx].set_texture(Code.image_map[submission[idx]])


func render_hints(correct: int, white: int):
	var hints = $Hints.get_children()
	for hint in hints.slice(0, correct):
		hint.set_texture(Code.hint_map[2])

	for hint in hints.slice(correct, white):
		hint.set_texture(Code.hint_map[1])


func _ready():
	inputs = {
		0: $Input/Box1,
		1: $Input/Box2,
		2: $Input/Box3,
		3: $Input/Box4
	}
