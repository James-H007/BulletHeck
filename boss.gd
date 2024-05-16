extends Node2D



func _ready():
	pass

func summon_attack():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.position = %BossPoint.global_position  # Set the initial position of the bullet
	new_bullet.rotation = %BossPoint.global_rotation # Example: Aim towards the mouse position
	# Set the bullet's trajectory
	$BossPoint.add_child(new_bullet)

func _physics_process(delta):
	
	if Input.is_action_pressed("shoot"):
		summon_attack()
	#for bullet in $BossPoint.get_children():
		#if bullet:
			#bullet.rotate_bullet()
