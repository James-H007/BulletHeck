extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_retry_button_pressed():
	#$Click.play()
	#await get_tree().create_timer(.3).timeout
	#TransitionScreen.transition()
	#await TransitionScreen.on_transition_finished
	get_tree().paused = false
	get_tree().change_scene_to_file("res://game.tscn")
	
