extends Area2D
class_name Sensor

var target : CollisionObject2D
var collisions = []

var target_distance : get = _get_distance
var target_direction : get = _get_direction


func _ready():
	body_entered.connect(store_body)
	body_exited.connect(remove_body)

@warning_ignore("unused_parameter")
func _physics_process(delta):
	scan()

func _get_distance() -> float:
	return global_position.distance_to(target.global_position)

func _get_direction():
	return target.global_position - global_position

func store_body(body):
	collisions.append(body)
	
func remove_body(body):
	collisions.erase(body)
	if collisions.size() == 0:
		target = null

func scan()->void:
	if collisions.size() == 0:
		return
		
	var closestBody = find_closest_body(collisions)
	if closestBody != null:
		target = closestBody
	else:
		target = null

func find_closest_body(bodies: Array) -> CollisionObject2D:
	var closestDistance = 1000
	var closestBody = null
	
	if bodies.size() == 0:
		target = null
		return
		
	for body in bodies:
		if body != null:
			var distance = body.global_position.distance_to(global_position)
			if distance < closestDistance:
				closestDistance = distance
				closestBody = body
				target = closestBody
				
	return closestBody			
