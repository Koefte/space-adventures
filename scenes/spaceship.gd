extends CharacterBody3D

@export var acceleration: float = 10.0
@export var move_speed: float = 10.0
@export var rotation_speed = 0.5

@onready var ship_node = $CSGBox3D

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("move_forward"):
		velocity.z = lerpf(velocity.z, -move_speed, acceleration * delta)
	else:
		velocity.z =  lerpf(velocity.z,0,acceleration*delta)
	if Input.is_action_pressed("move_left"):	
		rotation.z = lerpf(rotation.z,deg_to_rad(45.0),rotation_speed*delta)
	elif Input.is_action_pressed("move_right"):
		rotation.z = lerpf(rotation.z,deg_to_rad(-45.0),rotation_speed*delta)
	var ship_tilt = rad_to_deg(rotation.z)
	print(ship_tilt,velocity.z)
	if abs(ship_tilt) > 5.0 and abs(velocity.z) > 0.1:
		print("Got here",ship_tilt,velocity.z)
		rotation.y += deg_to_rad((rad_to_deg(rotation.z) / 45.0 )* 60.0) * delta
	move_and_slide()
