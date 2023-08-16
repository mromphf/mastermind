extends Node2D

const _RED = Code.Hints.RED

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


func render(hints: Array):
	_hints = hints
	_nodes = $Control.get_children()

	if hints.size() == 4 and hints.all(func(x: int): return x == _RED):
		$Beep.play()
		for node in _nodes:
			node.set_texture(Code.hint_map[_RED])
	else:
		$Timer.start()
