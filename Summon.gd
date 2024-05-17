extends State

 
#@onready var collision = $"../../PlayerDetection/CollisionShape2D"
#@onready var progress_bar = owner.find_child("ProgressBar")
var can_transition: bool = false
@export var turret_node: PackedScene
@export var turret_node2: PackedScene
@onready var rng = RandomNumberGenerator.new()
@onready var SpawnPosition: Vector2 = owner.global_position 
@onready var SpawnPosition2: Vector2 = owner.global_position 
 
func enter():
	super.enter()
	#animation_player.play("ranged_attack")
	#await animation_player.animation_finished
	
	if %BossPoint2.get_child_count() >= 2:
		can_transition = true
	else:
		%SummonTimer.start()
		can_transition = true
	
 
func summon():
	#print("Spawn Position", SpawnPosition)
	var turret = turret_node.instantiate()
	var turret2 = turret_node2.instantiate()
	turret.global_position = SpawnPosition + Vector2(rng.randi_range(-350,-650),rng.randi_range(0,500))
	turret2.global_position = SpawnPosition2 + Vector2(rng.randi_range(-350,-650),rng.randi_range(0,500))
	print("Turret Position", turret.position)
	%BossPoint2.add_child(turret)
	%BossPoint2.add_child(turret2)

func _on_summon_timer_timeout():
	summon()

func _on_timer_timeout():
		pass
 
func transition():
	if can_transition:
		can_transition = false
		print("I transitioned")
		get_parent().change_state("HomingMissile")
	else:
		pass



