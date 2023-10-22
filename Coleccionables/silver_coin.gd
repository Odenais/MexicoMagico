extends Node2D

func _process(delta):
	$AnimationPlayer.play("new_animation")

func _on_body_entered(body):
	
	if body.name == "Player":
		Global.piedras += 1;
		
		queue_free()
