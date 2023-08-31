extends Node2D

class_name Board

signal game_over

const _MAX_ROUNDS = 9

@onready var _OUTPUTS = $OutputHousing.get_children()

var code = {}
var rnd = 0

func on_game_over():
	emit_signal(&"game_over", code, true)

func reset():
	rnd = 0
	code = Code.generate()
	for node in $OutputHousing.get_children():
		node.reset()

func update(submission: Dictionary):
	var target = _OUTPUTS[rnd]
	var evaluated: Submission = Code.evaluate(code, submission)


	if rnd == _MAX_ROUNDS and not evaluated.cracked():
		$Buzzer.play()
		emit_signal(&"game_over", code)

	rnd += 1
	target.render_submission(evaluated)


func _ready():
	code = Code.generate()
	for node in _OUTPUTS:
		node.connect("code_cracked", $Vault.unlock)
