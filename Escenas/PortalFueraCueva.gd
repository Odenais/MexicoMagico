extends Area2D
var scene = preload("res://Escenas/Cueva.tscn")
func _on_body_entered(body):
	if body.name == "Player":
		$"../Transicion".play("fade_out")
		get_tree().change_scene_to_packed(scene)

func _on_transicion_animation_finished(anim_name):
	pass
