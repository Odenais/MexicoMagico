extends Node2D

var enemy = preload("res://Escenas/enemy.tscn")
@export var spawnTime = 10
@onready var transition = $Transicion
var scene;
var score = 0
var enemies = []

func _ready():
	$Timer.start();

	
func eliminarNodosDeTipo(target_node):
	var hijos = target_node.get_children()
	for hijo in hijos:
		if hijo is CharacterBody2D:
			hijo.queue_free()
		else:
			eliminarNodosDeTipo(hijo)

func _physics_process(delta):
	if has_node("Player"):
		if $Player.is_queued_for_deletion():
			eliminarNodosDeTipo(self)
			$GameOver.visible = true
			$GameOver.text = $GameOver.text + str(score)
			print('GAME OVER - Score: ' + str(score))
			$Timer.stop()
		
func _on_timer_timeout():
	var enemyInstance = enemy.instantiate()
	add_child(enemyInstance)
	if spawnTime != 1:
		spawnTime -= 1;
	$Timer.wait_time = spawnTime
	# print('TIMER')
	# print($Timer.wait_time)
	$PanelContainer/HBoxContainer/Score.text = str(score)
	score += 1


func _on_button_pressed():
	scene = preload("res://Escenas/zacatecas.tscn");
	transition.play("fade_out");

func _on_transicion_animation_finished(anim_name):
	get_tree().change_scene_to_packed(scene);


func _on_button_2_pressed():
	scene = load("res://Escenas/map.tscn");
	transition.play("fade_out");
