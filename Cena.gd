extends Node2D

@onready var anim = $AnimationPlayer
@onready var transition = $Transicion
@onready var scene = preload("res://Escenas/zacatecas.tscn")

func _ready():
	anim.play("cutscene");
	
	if Input.is_action_just_pressed("ui_accept"): 
		anim.stop();
		
func play_anim(s: String):
	anim.play(s);

func stop_anim():
	anim.stop();

func change_scene():
	transition.play("fade_out");

func _on_transicion_animation_finished(anim_name):
	get_tree().change_scene_to_packed(scene);
	
func _on_button_pressed():
	get_tree().change_scene_to_packed(scene);
