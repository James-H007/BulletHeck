extends State

var can_transition: bool = false
@export var bullet_node: PackedScene
@onready var shoot_timer = $ShootTimer
@onready var rotator = $Rotator
@onready var stop_timer = $StopTimer
@onready var hp = $"../../UI/ProgressBar".value
var can_shoot = true
const rotate_speed = 1500
const shooter_timer_wait_time = 0.25
var spawn_point_count = 30
const radius = 100
const stop_timer_wait_time = 5.0 # Adjust the time after which shooting should stop

func enter():
	super.enter()
	can_shoot = true
	shoot_timer.start()
	stop_timer.wait_time = stop_timer_wait_time
	stop_timer.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	if hp > 300 and hp <= 600:
		spawn_point_count = 40
	elif hp < 300:
		spawn_point_count = 60
	var step = 2 * PI / spawn_point_count
	for i in range(spawn_point_count):
		var spawn_point = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		rotator.add_child(spawn_point)
	shoot_timer.wait_time = shooter_timer_wait_time

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_shoot:
		var new_rotation = rotator.rotation_degrees + rotate_speed * delta
		rotator.rotation_degrees = fmod(new_rotation, 360)
	hp = $"../../UI/ProgressBar".value

func _on_shoot_timer_timeout():
	if can_shoot:
		for s in rotator.get_children():
			var bullet = bullet_node.instantiate()
			if hp < 700 and hp >= 600:
				bullet.speed = 350
			elif hp < 600 and hp >= 300:
				bullet.speed = 450
			elif hp < 300:
				bullet.speed = 650
			get_tree().root.add_child(bullet)
			bullet.position = s.global_position + Vector2(3,0)
			bullet.rotation = s.global_rotation # Changed 'rotate' to 'rotation'
			if hp < 500:
				var bullet2 = bullet_node.instantiate()
				get_tree().root.add_child(bullet2)
				bullet2.position = s.global_position + Vector2(1,0)
				bullet2.rotation = s.global_rotation # Changed 'rotate' to 'rotation'

func transition():
	if can_transition:
		can_transition = false
		shoot_timer.stop() # Stopped shoot_timer instead of pause
		print("I transitioned")
		get_parent().change_state("HomingMissile")

func _on_stop_timer_timeout():
	can_transition = true
	shoot_timer.stop() # Stopped shoot_timer instead of pause
	can_shoot = false
	transition()
