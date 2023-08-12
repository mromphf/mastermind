extends Node

var c = Game.Colors

var img_map = {
	c.AQUA: preload("res://img/blc_aqua.svg"),
	c.YELLOW: preload("res://img/blc_yellow.svg"),
	c.GREEN: preload("res://img/blc_green.svg"),
	c.PINK: preload("res://img/blc_pink.svg"),
	c.PURPLE: preload("res://img/blc_purple.svg")
}

var code = {
	1: c.YELLOW,
	2: c.GREEN,
	3: c.AQUA,
	4: c.PINK
}


func _ready():
	var code_imgs = {
		1: img_map[code[1]],
		2: img_map[code[2]],
		3: img_map[code[3]],
		4: img_map[code[4]]
	}
	
	$HUD._draw_cheat_box(code_imgs);
