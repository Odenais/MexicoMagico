extends Node2D

@onready var scene = preload("res://Escenas/MenuPrincipal.tscn");

func _on_button_pressed():
	get_tree().change_scene_to_packed(scene)
