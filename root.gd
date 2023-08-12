extends Node

var c = Code.Colors


func _ready():
	var code = {
		1: c.YELLOW,
		2: c.GREEN,
		3: c.AQUA,
		4: c.PINK
	}
	
	$HUD._draw_cheat_box(code);
