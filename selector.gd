extends TextureButton

class_name Selector

signal selector_pushed

@export var ord: int = 0

func reset():
	ord = 0
	$Sprite.set_texture(Code.image_map[Code.Colors.WHITE])

func _update_text(text):
	$Sprite.set_texture(text)


func _pressed():
	$Snap.play()
	ord = ord + 1 if ord < 5 else 1
	emit_signal("selector_pushed", self)
