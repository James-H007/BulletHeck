extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	#print("I'm being pressed")
	$StartPress.play()	
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	#await get_tree().create_timer(.3).timeout
	get_tree().change_scene_to_file("res://intermission.tscn")
