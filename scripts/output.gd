extends Node2D

@onready var inputs = {
	0: $Input/Box1,
	1: $Input/Box2,
	2: $Input/Box3,
	3: $Input/Box4
}


func render_submission(submission: Submission):
	for idx in inputs.keys():
		inputs[idx].set_texture(Code.image_map[submission.code[idx]])

	$Hints.render(submission)


func reset():
	for ipt in inputs.values():
		ipt.set_texture(Code.EMPTY_BOX)

	$Hints.reset()
