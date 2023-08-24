extends Node2D

signal unlocked


func _rotate():
	emit_signal("unlocked")


func unlock():
	$Animation.play(&"unlock")
