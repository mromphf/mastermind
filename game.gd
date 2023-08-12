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

enum Hints {
	EMPTY = 0,
	WHITE = 1,
	RED = 2
}


static var image_map = {
	Colors.WHITE: preload("res://img/blc_white.svg"),
	Colors.AQUA: preload("res://img/blc_aqua.svg"),
	Colors.YELLOW: preload("res://img/blc_yellow.svg"),
	Colors.GREEN: preload("res://img/blc_green.svg"),
	Colors.PINK: preload("res://img/blc_pink.svg"),
	Colors.PURPLE: preload("res://img/blc_purple.svg")
}

static var hint_map = {
	Hints.EMPTY: preload("res://img/crc_empty.svg"),
	Hints.WHITE: preload("res://img/crc_white.svg"),
	Hints.RED: preload("res://img/crc_red.svg")
}
