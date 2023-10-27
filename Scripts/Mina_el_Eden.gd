extends Node2D

func _ready():
	$AudioStreamPlayer2D.play()
	


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Escenas/Mina_Nivel.tscn")
