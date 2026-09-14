extends CharacterBody3D

@export var acceleration: float = 10.0
@export var move_speed: float = 3.0
@export var steer_speed = 0.5
@export var steer_rotation_factor = 50
@export var deceleration_factor = 0.2

var steer_value = 0
var movement = Vector3.ZERO

@onready var ship_node = $CSGBox3D

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("move_forward"):
		movement = Vector3.FORWARD * move_speed
	else :
		movement.z = lerpf(movement.z, 0, deceleration_factor * delta * delta)
	
	if Input.is_action_pressed("move_left"):	
		steer_value = lerpf(steer_value, 1,steer_speed*delta)
	elif Input.is_action_pressed("move_right"):
		steer_value = lerpf(steer_value, -1,steer_speed*delta)
		
	rotation_degrees.z = steer_value * 45
	
	if movement.length() > 0.1:
		rotation_degrees.y += steer_value * steer_rotation_factor * delta
		
	velocity = movement.z * global_transform.basis.z
	
	move_and_slide()
