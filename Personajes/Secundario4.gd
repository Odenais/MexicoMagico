extends CharacterBody2D


var speed := 100
var direccion := 0.0
var jump := 320
const gravity := 15
signal change_position_request


var move_speed = 100
var is_waiting = true
var conteo = 0

func _physics_process(delta):
	$Timer.start()
	
	conteo = conteo+1
	print(conteo)
	if conteo <= 200:
		velocity.x = 0
		$AnimationPlayer.play("idle")
	if  conteo>200 && conteo <= 250:
		velocity.x = 1 * speed
		$Sprite2D.flip_h = false;
		$AnimationPlayer.play("walk")
	if  conteo>250 && conteo <= 450:
		velocity.x = 0
		$AnimationPlayer.play("idle")
	if conteo>450 && conteo <= 500:
		velocity.x = -1 * speed;
		$Sprite2D.flip_h = true;
		$AnimationPlayer.play("walk")
		
	if conteo == 500:
		conteo = 0
	move_and_slide()

