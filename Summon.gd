extends State

 
#@onready var collision = $"../../PlayerDetection/CollisionShape2D"
#@onready var progress_bar = owner.find_child("ProgressBar")
var can_transition: bool = false
@export var turret_node: PackedScene
@export var turret_node2: PackedScene
@onready var rng = RandomNumberGenerator.new()
@onready var SpawnPosition: Vector2 = owner.global_position 
@onready var SpawnPosition2: Vector2 = owner.global_position 
@onready var hp = $"../../UI/ProgressBar".value

func _physics_process(delta):
	hp = $"../../UI/ProgressBar".value
 
func enter():
	super.enter()
	#animation_player.play("ranged_attack")
	#await animation_player.animation_finished
	
	if %BossPoint2.get_child_count() >= 2 and hp > 400:
		can_transition = true
		transition()
	elif %BossPoint.get_child_count() >= 4 and hp <= 400:
		can_transition = true
		transition()
	else:
		%SummonTimer.start()
		can_transition = true
	
 
func summon():
	#print("Spawn Position", SpawnPosition)
	var turret = turret_node.instantiate()
	var turret2 = turret_node2.instantiate()
	turret.global_position = SpawnPosition + Vector2(rng.randi_range(-350,-650),rng.randi_range(180,250))
	turret2.global_position = SpawnPosition2 + Vector2(rng.randi_range(-350,-650),rng.randi_range(250,300))
	print("Turret Position", turret.position)
	%BossPoint2.add_child(turret)
	%BossPoint2.add_child(turret2)

func _on_summon_timer_timeout():
	summon()
	if hp <= 400:
		summon()
	can_transition = true
	transition()

func _on_timer_timeout():
		pass
 
func transition():
	var rng = RandomNumberGenerator.new()
	var heads_or_tails = rng.randi_range(1,2)
	
	if can_transition:
		can_transition = false
		print("I transitioned")
		if (hp < 700) and (heads_or_tails == 1):
			get_parent().change_state("RotateAttack")
		else:
			get_parent().change_state("HomingMissile")
	else:
		pass



