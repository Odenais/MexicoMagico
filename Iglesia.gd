extends Node2D

func _ready():
	$AudioStreamPlayer2D2.play()

func _on_sonido_tianguis_body_entered(body):
	
	if body.name == "Jugador":
		$AudioStreamPlayer2D2.stop()
		$AudioStreamPlayer2D.play()



func _on_portal_salida_body_entered(body):
	if body.name == "Jugador":
		get_tree().change_scene_to_file("res://Mapas/Santuario.tscn")
		
