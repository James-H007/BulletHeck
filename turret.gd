extends CharacterBody2D

@export var bullet_node: PackedScene
@onready var player = get_node("/root/Game/Player")

var health = 5

func shoot():
	var bullet = bullet_node.instantiate()
	bullet.global_position = $Origin.global_position
	$Origin.add_child(bullet)

func _ready():
	#var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	#$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])
	#$AnimatedSprite2D.play("smoke")
	$AnimatedSprite2D.play("trumpet")

func _physics_process(delta):
	#var direction = global_position.direction_to(player.global_position)
	#velocity = direction * 300.0
	#move_and_slide()
	pass

	
func take_damage():
	health -= 1
	if health <= 0:
		queue_free()


func _on_bullet_timer_timeout():
	shoot()
