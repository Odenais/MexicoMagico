extends Area2D



func _on_body_entered(body):
	if body.name == "Player":
		body.move_local_x(-1000)
		body.move_local_y(-300)
