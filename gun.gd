extends Area2D

@export var speed = 200
var velocity = Vector2()
var mouse_position = null
var can_shoot = true

func _physics_process(delta):
	
	mouse_position = get_global_mouse_position()
	look_at(mouse_position)
	
	if can_shoot:
		shoot()
	#if Input.is_action_pressed("shoot") and can_shoot:
		#shoot()

func shoot():
	
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)
	can_shoot = false
	$gun_timer.start() #Starts the timer to allow player to shoot again


func _on_timer_timeout():
	#print("testing")
	can_shoot = true
