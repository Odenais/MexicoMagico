extends CharacterBody2D
@onready var anim := $AnimationPlayer

func _ready():
	anim.play("idle")

func anim_walk():
	anim.play("walk")
