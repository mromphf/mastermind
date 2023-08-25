extends Control

signal publish_submission

@onready var selectors = $Selections.get_children()


func on_selection():
	$Submit.disabled = not selectors \
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
	for selector in selectors:
		selector.reset()
