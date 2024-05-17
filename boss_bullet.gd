extends Area2D
 
 
#@onready var animated_sprite = $AnimatedSprite2D
@onready var player = get_node("/root/Game/Player")
 
var acceleration: Vector2 = Vector2.ZERO 
var velocity: Vector2 = Vector2.ZERO
var direction = Vector2.DOWN
var travelled_distance = 0
 
func _physics_process(delta):
	
	var rng = RandomNumberGenerator.new()
	#acceleration = (player.position - position).normalized() * 700
	const SPEED = 220
	const RANGE = 600
 
	velocity += acceleration * delta
	rotation = velocity.angle()
	direction = Vector2(rng.randf_range(-5,5), 1)
	#direction = Vector2.DOWN
 	
	travelled_distance += SPEED * delta
	
	if travelled_distance > 1500:
		queue_free()
 
	position += direction * SPEED * delta
 
 
func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
