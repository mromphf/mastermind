extends Node2D

signal code_cracked

@onready var inputs = {
	0: $Input/Box1,
	1: $Input/Box2,
	2: $Input/Box3,
	3: $Input/Box4
}

var _hints = []
var _nodes = []


func _tick():
	if _hints.is_empty():
		$Timer.stop()
	else:
		$Beep.play()
		_nodes.pop_front() \
			.set_texture(Code.hint_map[_hints.pop_front()])


func reset():
	$BoxAnimations.play(&"reset")
	$HintAnimations.play(&"reset")


func render_submission(submission: Submission):
	_hints = submission.hints()
	_nodes = $Hints.get_children()
	
	for idx in inputs.keys():
		inputs[idx].set_texture(Code.image_map[submission.index(idx)])

	if submission.cracked():
		$HintAnimations.play(&"unlocked")
	else:
		$Timer.start()

