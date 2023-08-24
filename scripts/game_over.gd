extends Node2D

signal play_again


func render(code: Dictionary, victory: bool = false):
	self.visible = true
	$Center/Victory.visible = victory
	$Center/Fail.visible = not victory
	$Center/Code/Block1.set_texture(Code.image_map[code[1]])
	$Center/Code/Block2.set_texture(Code.image_map[code[2]])
	$Center/Code/Block3.set_texture(Code.image_map[code[3]])
	$Center/Code/Block4.set_texture(Code.image_map[code[4]])


func _on_play_again():
	$Snap.play()
	emit_signal("play_again")
