extends Node2D

signal unlocked


func _rotate():
	$Lock.rotate(deg_to_rad(10))
	if $Lock.rotation_degrees >= 360:
		$Timer.stop()
		$Unlock.play()
		$Lock.rotation_degrees = 0
		emit_signal("unlocked")
	

func unlock():
	$Spin.play()
	$Timer.start()
	
