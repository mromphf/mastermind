extends Object

class_name Code

enum Colors {
	WHITE = 0,
	AQUA = 1,
	GREEN = 2,
	PINK = 3,
	PURPLE = 4,
	YELLOW = 5
}

enum Hints {
	EMPTY = 0,
	WHITE = 1,
	RED = 2
}

const _TARGETS = [
	Code.Colors.AQUA,
	Code.Colors.GREEN,
	Code.Colors.PINK,
	Code.Colors.PURPLE,
	Code.Colors.YELLOW
]

static var EMPTY_BOX = preload("res://img/blc_empty.svg")
static var EMPTY_CIRCLE = preload("res://img/crc_empty.svg")

static var image_map = {
	Colors.WHITE: preload("res://img/blc_white.svg"),
	Colors.AQUA: preload("res://img/blc_aqua.svg"),
	Colors.YELLOW: preload("res://img/blc_yellow.svg"),
	Colors.GREEN: preload("res://img/blc_green.svg"),
	Colors.PINK: preload("res://img/blc_pink.svg"),
	Colors.PURPLE: preload("res://img/blc_purple.svg")
}

static var hint_map = {
	Hints.EMPTY: preload("res://img/crc_empty.svg"),
	Hints.WHITE: preload("res://img/crc_white.svg"),
	Hints.RED: preload("res://img/crc_red.svg")
}


static func evaluate(code: Dictionary, submission: Dictionary):
	var unique = {}
	for val in submission.values():
		unique[val] = val

	var reds = code.keys() \
		.filter(func(entry: int): return code[entry] == submission[entry]) \
		.map(func(entry: int): return code[entry])

	var whites = unique.values() \
		.filter(func(entry: int): return entry in code.values()) \
		.filter(func(entry: int): return entry not in reds) \
		.size()

	return Submission.new(submission.values(), reds.size(), whites)


static func generate():
	randomize()
	return {
		1: _TARGETS.pick_random(),
		2: _TARGETS.pick_random(),
		3: _TARGETS.pick_random(),
		4: _TARGETS.pick_random()
	}
