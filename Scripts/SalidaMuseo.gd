extends Area2D
var scene = preload("res://Escenas/coahuila.tscn")
func _on_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_packed(scene)
