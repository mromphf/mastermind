extends Node

const _MAX_ROUNDS = 10
const _TARGETS = [
	Code.Colors.AQUA,
	Code.Colors.GREEN,
	Code.Colors.PINK,
	Code.Colors.PURPLE,
	Code.Colors.YELLOW
]

var code = {}
var rnd = 1


func _unique(arr):
	var res = []
	for x in arr:
		if x not in res:
			res.push_back(x)
	return res

func _gen_code():
	return {
		1: _TARGETS.pick_random(),
		2: _TARGETS.pick_random(),
		3: _TARGETS.pick_random(),
		4: _TARGETS.pick_random()
	}


func on_play_again():
	$Board.reset()
	$HUD.reset()
	$GameOver.visible = false
	code = _gen_code()
	rnd = 1


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
		$Unlocked.play()
		$GameOver.render(code, true)
	elif rnd == _MAX_ROUNDS:
		$Buzzer.play()
		$GameOver.render(code)
	rnd += 1


func _ready():
	randomize()
	code = _gen_code()
