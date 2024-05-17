extends Area2D

const speed = 200

func _process(delta):
	position += transform.x * speed * delta


func _on_kill_timer_timeout():
	queue_free()

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
