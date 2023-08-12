extends Node


func on_submission(submission):
	$Board.update(submission)


func _ready():
	var code = [1, 2, 2, 4]
	$HUD._draw_cheat_box(code);
