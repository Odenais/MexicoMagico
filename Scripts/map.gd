extends Node2D

var enemy = preload("res://Escenas/enemy.tscn")
@export var spawnTime = 10
var score = 0
var enemies = []

func _ready():
	$Timer.start()
	$GameOver.visible = false
	
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
