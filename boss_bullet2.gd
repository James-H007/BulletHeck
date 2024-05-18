extends Area2D

var speed = 150

func _process(delta):
	position += transform.x * speed * delta


func _on_kill_timer_timeout():
	queue_free()

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
