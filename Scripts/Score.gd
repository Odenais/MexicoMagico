extends Label

func _process(delta):
	text = "puntos: " + str(Global.score)

func _on_score_timer_timeout():
	Global.score += 1
