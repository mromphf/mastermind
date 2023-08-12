extends Node
var code = {}
var c = Code.Colors

var __debug = {
	c.AQUA: "Aqua",
	c.GREEN: "Green",
	c.PINK: "Pink",
	c.PURPLE: "Purple",
	c.YELLOW: "Yellow"
}

func on_submission(submission: Dictionary):
	var pos_cor = code.keys() \
		.filter(func(x: int): return code[x] == submission[x])

	var red = pos_cor.size()

	var white = submission.values() \
		.filter(func(x: int): return x in code.values() and x not in pos_cor) \
		.size()

	$Board.update(submission.values(), red, white)


func _ready():
	var targets = [c.AQUA, c.GREEN, c.PINK, c.PURPLE, c.YELLOW]

	code = {
		1: targets.pick_random(),
		2: targets.pick_random(),
		3: targets.pick_random(),
		4: targets.pick_random()
	}
	print(code.values().map(func(x: int): return __debug[x]))
	# $HUD._draw_cheat_box(code.values());
