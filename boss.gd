extends CharacterBody2D

@export var maxHealth = 1000
@onready var currentHealth = maxHealth

const whiten_duration = 0.15
@export var whiten_material: ShaderMaterial

func _ready():
	$AnimatedSprite2D.play("default")
	$Barrier.visible = false
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
	var tween = create_tween()
	if  currentHealth < 800 and currentHealth >= 600:
		$Barrier.visible = true
		$Barrier.play("default")
	elif currentHealth < 600 and currentHealth >= 400:
		tween.tween_property($Barrier, "scale", Vector2(1,1), 2)
	elif currentHealth < 400 and currentHealth >= 1:
		tween.tween_property($Barrier, "scale", Vector2(1,1), 2)

	
			
func take_damage():
	#print("I'm taking damage")
	var tween = create_tween()
	tween.tween_property($AnimatedSprite2D, "modulate", Color.DARK_RED, 0.1)
	tween.tween_property($AnimatedSprite2D, "modulate", Color.WHITE, 0.1)
	#$AnimatedSprite2D.modulate = Color.DARK_RED
	#await get_tree().create_timer(0.1).timeout
	#$AnimatedSprite2D.modulate = Color.WHITE
	currentHealth -= 3.0
	$UI/ProgressBar.value = currentHealth
	print($UI/ProgressBar.value)
	if currentHealth <= 0.0:
		#$Boss.pause()
		queue_free()
