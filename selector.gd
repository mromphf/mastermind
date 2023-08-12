extends Control

class_name Selector

signal selector_pushed

@export var ord: int = 0

func _update_text(text):
	$TextureButton/TextureRect.texture = text

func _on_pressed():
	ord += 1
	emit_signal("selector_pushed", self, ord)
