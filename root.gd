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


func _unique(arr):
	var res = []
	for x in arr:
		if x not in res:
			res.push_back(x)
	return res


func on_submission(submission: Dictionary):
	var hits = code.keys() \
		.filter(func(x: int): return code[x] == submission[x]) \
		.map(func(x: int): return code[x])

	var white = _unique(submission.values()) \
		.filter(func(x: int): return x in code.values()) \
		.filter(func(x: int): return x not in hits) \
		.size()

	$Board.update(submission.values(), hits.size(), white)


func _ready():
	var targets = [c.AQUA, c.GREEN, c.PINK, c.PURPLE, c.YELLOW]

	code = {
		1: targets.pick_random(),
		2: targets.pick_random(),
		3: targets.pick_random(),
		4: targets.pick_random()
	}
	print(code.values().map(func(x: int): return __debug[x]))
#	$HUD._draw_cheat_box(code.values());
