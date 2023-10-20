extends Area2D
class_name HealthComponent

signal onDead 
signal onDamage

@export var max_health : int = 1
var current_health : int = 0
@onready var enemy : Enemy = $Enemy as Enemy

func _ready() -> void:
	current_health = max_health
	
func take_healt(value : int):
	#salud al personaje
	set_health(value)
## Calcula el daño, no es necesario ponerlo en negativo
func take_damage(damage : int):
	#daño al personaje
	var value = abs(damage)
	set_health(-value)
	
func set_health(value : int):
	current_health += value
	current_health = clamp(current_health, 0, max_health)
	
	if current_health <= 0:
		dead()

func dead():
	emit_signal("onDead")
	get_parent().queue_free()
