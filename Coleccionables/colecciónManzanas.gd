extends Area2D

func _ready():
	$AnimationPlayer.play("new_animation")
	
func _on_body_entered(body):
	if body.name == "Jugador":
		Global.coleccionables+=1
		queue_free()
		

