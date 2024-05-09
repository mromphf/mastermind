extends Control

class_name Selector

signal selector_pushed

@export var ordinal: int = 0

func is_selected() -> bool:
	return ordinal > 0

func reset():
	ordinal = 0
	$Sprite.set_texture(Code.image_map[ordinal])

func _on_click(event:InputEvent):
	if event.is_pressed():
		if event.button_mask == MOUSE_BUTTON_RIGHT:
			ordinal = max(1, ordinal - 1)
		else:
			ordinal = min(5, ordinal + 1)

		$Sprite.set_texture(Code.image_map[ordinal])
		$Click.play()
		emit_signal("selector_pushed")
