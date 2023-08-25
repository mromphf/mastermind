extends Node2D

class_name Board

signal game_over

const _MAX_ROUNDS = 10

@onready var _OUTPUTS = $OutputHousing.get_children()

var code = {}
var rnd = 1

func on_game_over():
	emit_signal(&"game_over", code, true)

func reset():
	rnd = 1
	code = Code.generate()
	for node in $OutputHousing.get_children():
		node.reset()

func update(submission: Dictionary):
	var target = _OUTPUTS[max(0, rnd - 1)]
	var evaluated: Submission = Code.evaluate(code, submission)
	
	if rnd == _MAX_ROUNDS and not evaluated.cracked():
		$Buzzer.play()
		emit_signal(&"game_over", code)

	rnd += 1
	target.render_submission(evaluated)
	evaluated.queue_free()

func _ready():
	code = Code.generate()
	for node in _OUTPUTS:
		node.connect("code_cracked", $Vault.unlock)
