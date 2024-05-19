extends Node2D

@onready var camera1 = $Path2D/PathFollow2D/Camera2D

var is_opening

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")
	pass # Replace with function body.

func _physics_process(delta):
	var pathfollower = $Path2D/PathFollow2D
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

