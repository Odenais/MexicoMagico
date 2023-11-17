extends CharacterBody2D

@onready var running = $AnimatedSprite2D

signal hit

var health = 1
const SPEED = 300.0
const JUMP_VELOCITY = -430

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 1100

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		gravity = 1100
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		gravity = 1100
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("ui_down"):
		gravity = 3000
	move_and_slide()

func Player_hit():
	emit_signal("hit")
	health -= 1
	if health == 0 :
		queue_free()

func _ready():
	running.play("Correr")
