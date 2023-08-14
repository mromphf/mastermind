extends Control

signal publish_submission

var c = Code.Colors
var img_map = Code.image_map


func on_selection():
	$Submit.disabled = not $Selections.get_children() \
		.all(func(s: Selector): return s.is_selected())
	
	
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
	for selector in $Selections.get_children():
		selector.reset()

func _ready():
	for selector in $Selections.get_children():
		selector.connect("selector_pushed", on_selection)
