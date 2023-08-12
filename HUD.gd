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
	$CheatBox/Cheat1.set_texture(img_map[imgs[0]])
	$CheatBox/Cheat2.set_texture(img_map[imgs[1]])
	$CheatBox/Cheat3.set_texture(img_map[imgs[2]])
	$CheatBox/Cheat4.set_texture(img_map[imgs[3]])


func on_selection(sel: Selector):
	sel._update_text(img_map[sel.ord])
	
	
func _on_submit():
	var arr = $Selections.get_children() \
		.map(func(s:Selector): return s.ord)
	print(arr == [1, 2, 2, 4])
	
	
func _ready():
	for selector in $Selections.get_children():
		selector.connect("selector_pushed", on_selection)
