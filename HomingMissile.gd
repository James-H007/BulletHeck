extends State
 
@export var bullet_node: PackedScene
var can_transition: bool = false
@onready var hp = $"../../UI/ProgressBar".value

#var boss_hp = $"../..".currentHealth
 
var counter = 0

func enter():
	super.enter()
	counter = 0
	#animation_player.play("ranged_attack")
	#await animation_player.animation_finished
	%HomingTimer.start()
	shoot()

func _physics_process(delta):
	hp = $"../../UI/ProgressBar".value
 
func shoot():
	#print("my value:", $"../../UI/ProgressBar".value)
	#print("Shooting")
	print("My Hp: ", hp)
	var bullet = bullet_node.instantiate()
	if hp > 800 and hp <= 900:
		bullet.speed = 200
	elif hp > 700 and hp <= 800:
		bullet.speed = 250
	elif hp > 400 and hp <= 700:
		bullet.speed = 300
	elif hp <= 400:
		bullet.speed = 350
	bullet.position = owner.position
	%BossPoint.add_child(bullet)


func _on_timer_timeout():
	shoot()
	shoot()
	shoot()
	if hp <= 700:
		shoot()
	if hp <= 400:
		shoot()
	counter += 1
	if counter > 3 and (hp < 900):
		can_transition = true
		%HomingTimer.stop()
		transition()
 
func transition():
	var rng = RandomNumberGenerator.new()
	var heads_or_tails = rng.randi_range(1,2)
	if can_transition:
		can_transition = false
		#print("I transitioned")
		if (hp < 800) and (heads_or_tails == 1):
			get_parent().change_state("RotateAttack")
		else:
			get_parent().change_state("Summon")
	
	
	pass



