extends Node2D

var _hints = []
var _nodes = []

func _tick():
	if not _hints.is_empty():
		$Beep.play()
		_nodes.pop_front().set_texture(_hints.pop_back())
	else:
		$Timer.stop()


func reset():
	for h in $Control.get_children():
		h.set_texture(Code.hint_map[Code.Hints.EMPTY])


func render(hints: Array):
	_hints = hints
	_nodes = $Control.get_children()
	$Timer.start()
