extends Node3D

@export var max_speed_rock = 5
@export var min_speed_rock = 2
@export var spawn_interval = 5

@onready var asteroids = preload("res://assets/asteroids.glb")

var active_rocks : Array[Node]

var rocks : Array[Node]

var timer = 0

func _ready() -> void:
	rocks = asteroids.instantiate().get_children()
	spawn_rock()

func spawn_rock() -> void:
	var rock = rocks[randi_range(0,rocks.size() - 1)]
	add_child(rock)
	active_rocks.append(rock)
	
func delete_rock(target: Node) -> void:
	active_rocks.erase(target)
	remove_child(target)
	
func _process(delta: float) -> void:
	timer += delta
	if timer > spawn_interval:
		spawn_rock()
		timer = 0
		
	
	
