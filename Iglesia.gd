extends Node2D

func _ready():
	$AudioStreamPlayer2D2.play()
	$Sprite2D/AnimationPlayer.play("new_animation")


func _on_portal_salida_body_entered(body):
	if body.name == "Jugador":
		get_tree().change_scene_to_file("res://Mapas/Santuario.tscn")
		
