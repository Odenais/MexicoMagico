extends Node2D

@onready var transition = $Transicion
var opc = ""
var scene
func _ready():
	transition.play("fade_in")
	$AudioStreamPlayer2D.play()
func _process(delta):
	if $TextureButton2.is_hovered():
		$Label.text = "Coahuila"
	elif $TextureButton.is_hovered():
		$Label.text = "Zacatecas"
func _on_texture_button_pressed():
	transition.play("fade_out")
	opc = "ZAC"
	scene = preload("res://Escenas/zacatecas.tscn")
	#get_tree().change_scene_to_file("res://Escenas/zacatecas.tscn")

func _on_texture_button_2_pressed():
	transition.play("fade_out")
	opc = "COA"
	scene = preload("res://Escenas/coahuila.tscn")
	#get_tree().change_scene_to_file("res://Escenas/coahuila.tscn")

func _on_transicion_animation_finished(anim_name):
	if opc == "ZAC":
		get_tree().change_scene_to_packed(scene)
	elif opc == "COA":
		get_tree().change_scene_to_packed(scene)

