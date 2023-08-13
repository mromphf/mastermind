extends Node2D

signal play_again

func _on_play_again():
	emit_signal("play_again")
