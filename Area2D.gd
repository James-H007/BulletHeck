extends Area2D

const whiten_duration = 0.15
@export var whiten_material: ShaderMaterial


func _on_area_entered(area):
	whiten_material.set_shader_parameter("whiten", true)
	await get_tree().create_timer(whiten_duration).timeout
	whiten_material.set_shader_parameter("whiten", false)
