extends CharacterBody3D


@export var dist:float = 0.8
@export var speed:float = 3.0

@export var jouneyCountdown:float
@export var jouneySeconds = 4
var movement:=Vector3.ZERO

@export var idleCountdown:float
@export var idleSeconds = 6
var idling:= true


func _ready():
	jouneyCountdown = jouneySeconds
	movement = rand_direction()


func _physics_process(delta):
	if idling:
		idle(delta)
	else:
		travel(delta)


func idle(delta:float):
	idleCountdown -= delta
	if idleCountdown < 0.0:
		idleCountdown = idleSeconds
		movement = rand_direction()
		idling = false


func travel(delta:float):
	jouneyCountdown -= delta
	if jouneyCountdown < 0.0:
		jouneyCountdown = jouneySeconds
		idling = true
	
	translate(movement * delta)
	move_and_collide(movement * delta)


func rand_direction():
	return Vector3(
		randf_range(-dist, dist),
		0,
		randf_range(-dist, dist)
	)
