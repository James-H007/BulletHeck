extends CanvasLayer

var can_blink = true

func _ready():
	$Crow1.play("default")
	$Crow2.play("default")
	$MurderMaestro.play("default")
	$Barrier.play("default")
	$Applause.play()




func _on_applause_finished():
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://game.tscn")
