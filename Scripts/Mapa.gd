extends Node2D
var obstaculo1 = load("res://Escenas/Obstaculo_1.tscn")
var obstaculo2 = load("res://Escenas/Obstaculo_2.tscn")
var obstaculo3 = load("res://Escenas/Obstaculo_3.tscn")
var obstaculo4 = load("res://Escenas/Obstaculo_4.tscn")

var obstaculo
var obs:int
var x:int

func _ready():
	instanciar()

func _on_jugador_hit():
	$Dead.play()
	$Menu.show_gameover()
	$ScoreTimer.stop()

func instanciar():
	obs = int(randf_range(1,5))
	x = int(randf_range(700,760))
	var y: int
	match obs:
		1:
			obstaculo = obstaculo1
			y = 290
		2:
			obstaculo = obstaculo2
			y = 300
		3:
			obstaculo = obstaculo3
			y = 300
		4:
			obstaculo = obstaculo4
			y = 310
	
	var newObstaculo = obstaculo.instantiate()
	add_child(newObstaculo)
	newObstaculo.position = Vector2(x, y)

func _on_score_timer_timeout():
	instanciar()
