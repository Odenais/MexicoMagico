extends CharacterBody2D
@onready var anim := $AnimationPlayer

func anim_play(s: String):
	if s == "walk":
		anim.play("walk");
	if s == "idle":
		anim.play("idle");
		
func _ready():
	anim.play("idle")
