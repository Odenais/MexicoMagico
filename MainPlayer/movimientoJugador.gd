extends CharacterBody2D

var speed := 200
var direccion := 0.0
var jump := 320
const gravity := 15
signal change_position_request

@onready var anim := $AnimationPlayer
@onready var sprite := $Sprite2D
@onready var piedrasLabel := $HBoxContainer/Label2



func _physics_process(delta):
	direccion = Input.get_axis("ui_left","ui_right")
	velocity.x = direccion * speed
	
	if direccion != 0:
		anim.play("walk")
	else:
		anim.play("idle")
		
	if direccion < 0:
		sprite.flip_h = true
	else:
		if direccion > 0:
			sprite.flip_h = false
		else:
			sprite.flip_h
	
		
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y -= jump
	if !is_on_floor():
		velocity.y += gravity	
	
	
	move_and_slide()
	
	


func _on_area_2d_body_entered(body):
	velocity.y += velocity.x
	move_and_slide()
