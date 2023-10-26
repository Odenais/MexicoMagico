extends Node

var shakestrength = 1
var randomsakestength = 30

@onready var shakedacay = 5
@onready var camera = $Camera2D
@onready var rand = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rand.randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	shakestrength = lerpf(shakestrength, 0, shakedacay * delta)
	camera.offset = get_random_offset()

func get_random_offset() -> Vector2:
	return Vector2(
		rand.randf_range(-shakestrength, shakestrength),
		rand.randf_range(-shakestrength, shakestrength)
	)

func _on_jugador_hit():
	apply_shake()
	
func apply_shake():
	shakestrength = randomsakestength
