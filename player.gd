extends CharacterBody2D

signal health_depleted

@export var maxHealth = 100
@onready var currentHealth = maxHealth
@onready var is_invincible = false



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = direction * 300
	
	move_and_slide()
	# Clamp the position to the viewport
	clamp_to_viewport()
	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		#for mob in overlapping_mobs:
			#print(mob.name)
		currentHealth -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%Health_bar.value = currentHealth
		if currentHealth <= 0.0:
			health_depleted.emit()

func clamp_to_viewport():
	# Get the viewport size
	var viewport_size = get_viewport_rect().size
	
	# Clamp the position
	position.x = clamp(position.x, 0, viewport_size.x)
	position.y = clamp(position.y, 0, viewport_size.y)
	
func take_damage():

	
	if !is_invincible:
		currentHealth -= 5.0
		is_invincible = true
		$Sprite2D.self_modulate.a = 0.5
		await get_tree().create_timer(.7).timeout
		$Sprite2D.self_modulate.a = 1
		is_invincible = false
		
	%Health_bar.value = currentHealth
	if currentHealth <= 0.0:
		health_depleted.emit()
	

