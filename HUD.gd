extends Control

signal publish_submission

var c = Code.Colors

var img_map = Code.image_map


func _draw_cheat_box(imgs):
	$CheatBox/Cheat1.set_texture(img_map[imgs[0]])
	$CheatBox/Cheat2.set_texture(img_map[imgs[1]])
	$CheatBox/Cheat3.set_texture(img_map[imgs[2]])
	$CheatBox/Cheat4.set_texture(img_map[imgs[3]])


func on_selection(sel: Selector):
	$Submit.disabled = not $Selections.get_children() \
		.all(func(s: Selector): return s.ord > 0)
	sel._update_text(img_map[sel.ord])
	
	
func _on_submit():
	$Snap.play()
	var arr = $Selections.get_children() \
		.map(func(s:Selector): return s.ord)
	emit_signal("publish_submission", arr)
	
	
func _ready():
	for selector in $Selections.get_children():
		selector.connect("selector_pushed", on_selection)
