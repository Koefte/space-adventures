extends Node3D

@export var max_angle = 55

var lever_value = 0

func get_value() -> float: 
	return lever_value
	
func set_value(value: float) -> void:
	lever_value = clamp(value, -1, 1)
	
func _process(delta: float) -> void:
	$Armature/Skeleton3D/Lever.rotation_degrees.x = lever_value * max_angle
