extends Node2D

var _hints = []
var _idx = 0

func _tick():
	if not _hints.is_empty():
		$Beep.play()
		$Control.get_children()[_idx].set_texture(_hints.pop_back())
		_idx += 1
	else:
		$Timer.stop()


func reset():
	for h in $Control.get_children():
		h.set_texture(Code.hint_map[Code.Hints.EMPTY])


func render(hints: Array):
	_hints = hints
	$Timer.start()
