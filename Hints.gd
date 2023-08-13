extends Node2D

var _hints = []
var _nodes = []

func _tick():
	if _hints.is_empty():
		$Timer.stop()
	else:
		$Beep.play()
		_nodes.pop_front().set_texture(_hints.pop_back())


func reset():
	for h in $Control.get_children():
		h.set_texture(Code.hint_map[Code.Hints.EMPTY])


func render(hints: Array):
	_hints = hints
	_nodes = $Control.get_children()
	$Timer.start()
