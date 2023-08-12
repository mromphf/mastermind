extends Control


func _draw_cheat_box(imgs):
	$CheatBox/Cheat1.texture = imgs[1]
	$CheatBox/Cheat2.texture = imgs[2]
	$CheatBox/Cheat3.texture = imgs[3]
	$CheatBox/Cheat4.texture = imgs[4]


func _pressed():
	print("Hello world!")
