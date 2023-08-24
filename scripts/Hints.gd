extends Node2D

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
	for node in $Control.get_children():
		node.set_texture(Code.hint_map[Code.Hints.EMPTY])


func render(submission: Submission):
	_hints = submission.hints()
	_nodes = $Control.get_children()

	if submission.cracked():
		$Animation.play(&"unlocked")
	else:
		$Timer.start()
