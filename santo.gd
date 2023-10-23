extends Area2D



func _on_body_entered(body):
	print("Toco")
	if body.name == "Player":
		if Global.coleccionables == 5:
			$Sprite2D.scale.x=5.0;
			$Sprite2D.scale.y=5.0;
			$Sprite2D.position.y=-60.0;
			$PointLight2D.enabled = true;
			$AudioStreamPlayer2D2.play()
		else:
			$"../VBoxContainer".visible=true
			$AudioStreamPlayer2D.play()
			print("No tienes todo")
	
