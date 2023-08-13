extends TextureButton

class_name Selector

signal selector_pushed

@export var ord: int = 0

func is_selected():
	return ord > 0

func reset():
	ord = 0
	$Sprite.set_texture(Code.image_map[Code.Colors.WHITE])

func _update_text(text):
	$Sprite.set_texture(text)


func _on_click(event:InputEvent):
	if event.is_pressed():
		if event.button_mask == MOUSE_BUTTON_RIGHT:
			ord = max(1, ord - 1)
		elif event.button_mask == MOUSE_BUTTON_LEFT:
			ord = min(5, ord + 1)
		$Snap.play()
		emit_signal("selector_pushed", self)
