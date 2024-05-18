extends CharacterBody2D

@export var maxHealth = 1000
@onready var currentHealth = maxHealth

const whiten_duration = 0.15
@export var whiten_material: ShaderMaterial

func _ready():
	$AnimatedSprite2D.play("default")
	pass
#
#func summon_attack():
	#const BULLET = preload("res://bullet.tscn")
	#var new_bullet = BULLET.instantiate()
	#new_bullet.position = %BossPoint.global_position  # Set the initial position of the bullet
	#new_bullet.rotation = %BossPoint.global_rotation # Example: Aim towards the mouse position
	## Set the bullet's trajectory
	#$BossPoint.add_child(new_bullet)
#
#func _physics_process(delta):
	#
	#if Input.is_action_pressed("shoot"):
		#summon_attack()
	##for bullet in $BossPoint.get_children():
		##if bullet:
			##bullet.rotate_bullet()
func _physics_process(delta):
	pass
			
func take_damage():
	#print("I'm taking damage")
	var tween = create_tween()
	tween.tween_property($AnimatedSprite2D, "modulate", Color.DARK_RED, 0.1)
	tween.tween_property($AnimatedSprite2D, "modulate", Color.WHITE, 0.1)
	#$AnimatedSprite2D.modulate = Color.DARK_RED
	#await get_tree().create_timer(0.1).timeout
	#$AnimatedSprite2D.modulate = Color.WHITE
	currentHealth -= 4.0
	$UI/ProgressBar.value = currentHealth
	print($UI/ProgressBar.value)
	if currentHealth <= 0.0:
		queue_free()
