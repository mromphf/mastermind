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
	$Animation.play(&"reset")
	$Hints.reset()
