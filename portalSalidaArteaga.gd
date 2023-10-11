extends Area2D

var scene = preload("res://Escenas/coahuila.tscn")
func _on_body_entered(body):
	if body.name == "Player":
		$"../Transicion".play("fade_out")

func _on_transicion_animation_finished(anim_name):
	get_tree().change_scene_to_packed(scene)
