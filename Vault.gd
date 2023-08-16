extends Node2D

signal unlocked


func _rotate():
	$Lock.rotate(PI / 18)
	if $Lock.rotation >= PI * 2:
		$Timer.stop()
		$Unlock.play()
		$Lock.rotation_degrees = 0
		emit_signal("unlocked")
	

func unlock():
	$Spin.play()
	$Timer.start()
	
