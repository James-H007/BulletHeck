extends Node2D

var pause = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print("test")

	#$Barrier.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = true
		#$PauseMenu.Blur.visible = true
		$PauseMenu.show()
		
	
	#if  $Boss.currentHealth < 800 and $Boss.currentHealth > 500:
		#$Barrier.visible = true
		#$Barrier.play("default")
	#elif $Boss.currentHealth <= 500:
		#var tween = create_tween()
		#tween.tween_property($Barrier, "scale", Vector2(1.5,1.5), 1)
		#tween.tween_property($Barrier, "scale", Vector2(1,1), 1)
		#tween.tween_property($Barrier, "scale", Vector2(0,0), 1)
		
		
