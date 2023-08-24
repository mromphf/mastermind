extends Node2D

class_name Board

func reset():
	for node in $OutputHousing.get_children():
		node.reset()

func update(rnd, submission: Submission):
	var target = $OutputHousing.get_children()[max(0, rnd - 1)]
	target.render_submission(submission)
