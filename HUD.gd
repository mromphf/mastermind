extends Control

signal publish_submission

var c = Code.Colors
var img_map = Code.image_map


func on_selection(sel: Selector):
	$Submit.disabled = not $Selections.get_children() \
		.all(func(s: Selector): return s.is_selected())
	sel._update_text(img_map[sel.ord])
	
	
func _on_submit():
	$Snap.play()
	$Submit.disabled = true
	emit_signal("publish_submission", {
		1: $Selections/Selector1.ord,
		2: $Selections/Selector2.ord,
		3: $Selections/Selector3.ord,
		4: $Selections/Selector4.ord
	})


func reset():
	for sel in $Selections.get_children():
		sel.reset()

func _ready():
	for selector in $Selections.get_children():
		selector.connect("selector_pushed", on_selection)
