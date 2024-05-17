extends State
 
@export var bullet_node: PackedScene
var can_transition: bool = false
 
var counter = 0

func enter():
	super.enter()
	counter = 0
	#animation_player.play("ranged_attack")
	#await animation_player.animation_finished
	%HomingTimer.start()
	shoot()
	
 
func shoot():
	print("Shooting")
	var bullet = bullet_node.instantiate()
	bullet.position = owner.position
	%BossPoint.add_child(bullet)


func _on_timer_timeout():
	shoot()
	shoot()
	shoot()
	counter += 1
	if counter > 3:
		can_transition = true
		%HomingTimer.stop()
 
func transition():
	if can_transition:
		can_transition = false
		print("I transitioned")
		get_parent().change_state("Summon")
	
	pass



