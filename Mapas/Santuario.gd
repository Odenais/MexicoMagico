extends Node2D

func _ready():
	$AudioStreamPlayer2D.play()



func _on_area_2d_2_body_entered(body):
	if body.name == "Player":
		Global.coleccionables=0;
		get_tree().change_scene_to_file("res://Iglesia.tscn")
		
