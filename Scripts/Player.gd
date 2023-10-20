extends CharacterBody2D
class_name Player

@onready var movement: Movement = $Movement as Movement
@onready var animation = $AnimationPlayer

var input_vector : Vector2

func _ready():
	movement.setup(self)

func _process(delta):
	input_vector.x = Input.get_axis("ui_left","ui_right")
	input_vector.y = Input.get_axis("ui_up","ui_down")
	movements()
	

func _physics_process(delta):
	movement.move(input_vector.normalized())

func movements():
	if input_vector.y == 0 and input_vector.x == 0:
		animation.play("idle")
	elif Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_left"):
		animation.play("down_left")
	elif Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_right"):
		animation.play("down_right")
	elif Input.is_action_pressed("ui_down"):
		animation.play("down")
	elif Input.is_action_pressed("ui_left"):
		animation.play("left")
	elif Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_left"):
		animation.play("up_left")
	elif Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_right"):
		animation.play("up_right")
	elif Input.is_action_pressed("ui_up"):
		animation.play("up")
	elif Input.is_action_pressed("ui_right"):
		animation.play("right")

