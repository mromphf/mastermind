extends Control

var c = Code.Colors

var img_map = {
	c.AQUA: preload("res://img/blc_aqua.svg"),
	c.YELLOW: preload("res://img/blc_yellow.svg"),
	c.GREEN: preload("res://img/blc_green.svg"),
	c.PINK: preload("res://img/blc_pink.svg"),
	c.PURPLE: preload("res://img/blc_purple.svg")
}

func _draw_cheat_box(imgs):
	$CheatBox/Cheat1.texture = img_map[imgs[1]]
	$CheatBox/Cheat2.texture = img_map[imgs[2]]
	$CheatBox/Cheat3.texture = img_map[imgs[3]]
	$CheatBox/Cheat4.texture = img_map[imgs[4]]


func on_selection(sel: Selector, ord: int):
	sel._update_text(img_map[ord])
	
	
func _ready():
	for selector in $Control.get_children():
		selector.connect("selector_pushed", on_selection)

func _pressed():
	pass
