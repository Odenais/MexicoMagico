extends Node2D

func _ready():
	$AudioStreamPlayer2D.play()
	$Sprite2D/AnimationPlayer.play("new_animation")
	$VBoxContainer.visible=false
	if Global.coleccionables == 5:
		$Barrier/CollisionShape2D.disabled = true

func _on_area_2d_2_body_entered(body):
	if body.name == "Player":
		Global.coleccionables=0;
		get_tree().change_scene_to_file("res://Iglesia.tscn")
		
