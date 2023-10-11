extends Node
class_name Menu
@onready var transition = $Transicion
@onready var mex = preload("res://Escenas/world.tscn")

var dir = Vector2(1,0)
var speed = 60

func _physics_process(delta):
	$ParallaxBackground.scroll_base_offset += dir * speed * delta
	
func _ready():
	$AudioStreamPlayer2D.play()

func _on_button_play_pressed():
	transition.play("fade_out")

func _on_button_pressed():
	get_tree().quit()

func _on_transicion_animation_finished(anim_name):
	get_tree().change_scene_to_packed(mex)
