extends Node2D

signal unlocked

func unlock():
	$Animation.play(&"unlock")
