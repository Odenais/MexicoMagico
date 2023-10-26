extends Node

var obstaculo : Array
var index_control = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for obs in $Obstaculos.get_children():
		obstaculo.append(obs)

func _on_spawn_timer_timeout():
	obstaculo[index_control].position = $Marker2D.glo
	next_index()
	
func next_index():
	if index_control < obstaculo.size() - 1:
		index_control += 1
	else:
		index_control = 0
