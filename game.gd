extends Object

class_name Code

enum Colors {
	WHITE = 0,
	AQUA = 1,
	GREEN = 2,
	PINK = 3,
	PURPLE = 4,
	YELLOW = 5
}



static var image_map = {
	Code.Colors.WHITE: preload("res://img/blc_white.svg"),
	Code.Colors.AQUA: preload("res://img/blc_aqua.svg"),
	Code.Colors.YELLOW: preload("res://img/blc_yellow.svg"),
	Code.Colors.GREEN: preload("res://img/blc_green.svg"),
	Code.Colors.PINK: preload("res://img/blc_pink.svg"),
	Code.Colors.PURPLE: preload("res://img/blc_purple.svg")
}
