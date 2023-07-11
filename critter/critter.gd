extends CharacterBody3D


@export var dist:float = 0.8
@export var speed:float = 3.0

@export var jouneyCountdown:float
@export var jouneySeconds = 4
var movement:=Vector3.ZERO

@export var idleCountdown:float
@export var idleSeconds = 6
var idling:= true

@export var poiManager:Node3D


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
		idling = false
		
		new_movement()


func new_movement():
		if randi_range(0,2) > 1:
			movement = rand_direction()
		else:
			var pois = poiManager.get_pois()
			var i = randi_range(
				0,
				pois.size()-1
			)
			movement = (pois[i] - global_position) * .1


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
