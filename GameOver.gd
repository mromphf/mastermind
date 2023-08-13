extends Node2D

signal play_again


func render(victory: bool = false):
	self.visible = true
	$Victory.visible = victory
	$Fail.visible = not victory


func _on_play_again():
	emit_signal("play_again")
