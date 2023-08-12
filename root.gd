extends Node
var code = {}

func on_submission(submission: Dictionary):
	var red = code.keys() \
		.filter(func(x: int): return code[x] == submission[x]) \
		.size()

	var white = submission.values() \
		.filter(func(x: int): return x in code.values()) \
		.size()

	$Board.update(submission.values(), red, white)


func _ready():
	code = {
		1: Code.Colors.AQUA,
		2: Code.Colors.GREEN,
		3: Code.Colors.GREEN,
		4: Code.Colors.YELLOW
	}
	$HUD._draw_cheat_box(code.values());
