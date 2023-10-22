extends Area2D



func _on_body_entered(body):
	if body.name == "Player":
		if Global.coleccionables == 5:
			print("Ads")
			$Sprite2D.scale.x=5.0;
			$Sprite2D.scale.y=5.0;
			$Sprite2D.position.y=-60.0;
		else:
			$AudioStreamPlayer2D.play()
			print("No tienes todo")
