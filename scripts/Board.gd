extends Node2D

class_name Board

signal game_over

const _MAX_ROUNDS = 10

@onready var _OUTPUTS = $OutputHousing.get_children()

var code = {}
var rnd = 1

func _unique(arr):
	var res = []
	for x in arr:
		if x not in res:
			res.push_back(x)
	return res


func _evaluate(submission: Dictionary) -> Submission:
	var reds = code.keys() \
		.filter(func(x: int): return code[x] == submission[x]) \
		.map(func(x: int): return code[x])

	var whites = _unique(submission.values()) \
		.filter(func(x: int): return x in code.values()) \
		.filter(func(x: int): return x not in reds) \
		.size()

	return Submission.new(submission.values(), reds.size(), whites)

func on_game_over():
	emit_signal(&"game_over", code, true)

func reset():
	rnd = 1
	code = Code.generate()
	for node in $OutputHousing.get_children():
		node.reset()

func update(submission: Dictionary):
	var target = _OUTPUTS[max(0, rnd - 1)]
	var evaluated: Submission = _evaluate(submission)
	
	if rnd == _MAX_ROUNDS and not evaluated.cracked():
		$Buzzer.play()
		emit_signal(&"game_over", code)

	rnd += 1
	evaluated.queue_free()
	target.render_submission(evaluated)

func _ready():
	code = Code.generate()
	for node in _OUTPUTS:
		node.connect("code_cracked", $Vault.unlock)
