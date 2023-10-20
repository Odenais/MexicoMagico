extends CharacterBody2D
class_name Enemy

@onready var movement : Movement = $Movement as Movement
@onready var sensor: Sensor = $Sensor as Sensor
@onready var sprite_2d = $Sprite2D
@export var rotationSpeed = 1.2
var player : CollisionObject2D

func _ready():
	movement.setup(self)
	$AnimationPlayer.play("run")
	

func _physics_process(delta):
	if sensor.target != null:		
		if sensor.target_distance > 10:
			movement.move(sensor.target_direction)
		#if sensor.target_distance < 40:
		#	movement.move(-sensor.target_direction * 2)
			
		# rotate_to_target(sensor.target_direction,delta)
	

func rotate_to_target(direction, delta):
	var angleTo = sprite_2d.transform.y.angle_to(-direction)
	sprite_2d.rotate(sign(angleTo) * min(delta * rotationSpeed, abs(angleTo)))
