extends Area2D

var velocidad = 150
func _process(delta):
	position += Vector2.LEFT * velocidad * delta
	if position.x < -32:
		queue_free()

func _on_deteccion_body_entered(body):
	if body.is_in_group("Jugador"):
		Global.score += 5

func _on_body_entered(body):
	if body.has_method("Player_hit"):
		body.Player_hit()
