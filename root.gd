extends Node


const MAX_ROUNDS = 10
const c = Code.Colors

var code = {}
var rnd = 1

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

func _gen_code():
	var targets = [c.AQUA, c.GREEN, c.PINK, c.PURPLE, c.YELLOW]
	return {
		1: targets.pick_random(),
		2: targets.pick_random(),
		3: targets.pick_random(),
		4: targets.pick_random()
	}


func on_play_again():
	$Board.reset()
	$HUD.reset()
	$GameOver.visible = false
	code = _gen_code()
	rnd = 1
#	print(code.values().map(func(x: int): return __debug[x]))


func on_submission(submission: Dictionary):
	var hits = code.keys() \
		.filter(func(x: int): return code[x] == submission[x]) \
		.map(func(x: int): return code[x])

	var white = _unique(submission.values()) \
		.filter(func(x: int): return x in code.values()) \
		.filter(func(x: int): return x not in hits) \
		.size()

	$Board.update(rnd, submission.values(), hits.size(), white)

	if submission == code:
		$GameOver.render(code, true)
	elif rnd == MAX_ROUNDS:
		$GameOver.render(code)
	rnd += 1


func _ready():
	randomize()
	code = _gen_code()
#	print(code.values().map(func(x: int): return __debug[x]))
#	$HUD._draw_cheat_box(code.values())
