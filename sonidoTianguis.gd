extends Area2D



func _on_body_entered(body):
	if body.name == "Player":
		$"../AudioStreamPlayer2D2".stop()
		$"../AudioStreamPlayer2D".play()
