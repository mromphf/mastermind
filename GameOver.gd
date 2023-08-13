extends Node2D

signal play_again


func render(code: Dictionary, victory: bool = false):
	self.visible = true
	$Victory.visible = victory
	$Fail.visible = not victory
	$Code/Block1.set_texture(Code.image_map[code[1]])
	$Code/Block2.set_texture(Code.image_map[code[2]])
	$Code/Block3.set_texture(Code.image_map[code[3]])
	$Code/Block4.set_texture(Code.image_map[code[4]])


func _on_play_again():
	emit_signal("play_again")
