extends Node2D

@onready var transition = $Transicion
func _ready():
	transition.play("fade_in")
	$AudioStreamPlayer2D.play()

func _on_button_fresnillo_pressed():
	pass


func _on_button_jerez_pressed():
	pass # Replace with function body.


func _on_button_plateros_pressed():
	pass # Replace with function body.


func _on_button_volver_pressed():
	transition.play("fade_out")

func _on_transicion_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene_to_file("res://Escenas/world.tscn")
