extends Area2D

var travelled_distance = 0

var direction

func _physics_process(delta):
	#print("test")
	const SPEED = 1000
	const RANGE = 1200
	
	direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > 1200:
		queue_free()

#func rotate_bullet():
	#var random_angle = randf_range(0,PI) 
	#direction = Vector2.RIGHT.rotated(random_angle)

func _on_body_entered(body):
	queue_free() #Destroys the bullet
	if body.has_method("take_damage"):
		body.take_damage()
