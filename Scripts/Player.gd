extends CharacterBody2D

@export var speed = 100
@onready var animation = $Animation 

func checkAnimations():
	if velocity.x == 0 and velocity.y == 0:
		animation.play("idle")
	if Input.is_action_pressed("ui_down"):
		animation.play("down")
	elif Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_left"):
		animation.play("down_left")
	elif Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_right"):
		animation.play("down_right")
	if Input.is_action_pressed("ui_up"):
		animation.play("up")
	elif Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_left"):
		animation.play("up_left")
	elif Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_right"):
		animation.play("up_right")
	if Input.is_action_pressed("ui_left"):
		animation.play("left")
	if Input.is_action_pressed("ui_right"):
		animation.play("right")

func _process(delta):
	checkAnimations()
	
func _physics_process(delta):
	# Creamos un vector para determinar la direccion de movimiento del jugador
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	# Cambiamos la velocidad en funcion de la dirección del jugador
	velocity = input_direction * speed
	# Actualizamos constantemente para permitir el movimiento
	move_and_slide()
