extends CharacterBody2D

var velocidad = 60
var spawns : Array
var index_control = 0

func _ready():
	$AnimatedSprite2D.play("walk")
	velocity.x = -velocidad
	velocity.y = velocidad
	
	for spawn in $Spawners.get_children():
		spawns.append(spawn)
		
	self.position.x = spawns[randf_range(0,4)].position.x
	self.position.y = spawns[randf_range(0,4)].position.y
	# print("X: " + str(position.x))
	# print("Y: " + str(position.y))
	
func _physics_process(delta):
	if is_on_wall():
		if !$AnimatedSprite2D.flip_h:
			velocity.x = velocidad
			velocity.y = -velocidad
		else:
			velocity.x = -velocidad
			velocity.y = velocidad
	move_and_slide()
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = true


func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		if body.name == "Player":
			# print('Seguir')
			pass


func _on_hit_body_entered(body):
	if body is CharacterBody2D:
		if body.name == "Player":
			body.queue_free()
