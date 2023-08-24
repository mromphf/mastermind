extends Node2D

class_name Board

signal game_over


func on_game_over():
	emit_signal(&"game_over")

func reset():
	for node in $OutputHousing.get_children():
		node.reset()

func update(rnd, submission: Submission):
	var target = $OutputHousing.get_children()[max(0, rnd - 1)]
	target.render_submission(submission)

func _ready():
	for node in $OutputHousing.get_children():
		node.connect("code_cracked", $Vault.unlock)
