extends Node3D


var blueprint:= false:
	get:
		return blueprint
	set(value):
		blueprint = value
		if blueprint:
			set_collision_layers(false)
		else:
			set_collision_layers(true)


func _ready():
	blueprint = false


func set_collision_layers(value:bool):
	$StaticBody3D.set_collision_layer_value(1, value)
	$StaticBody3D.set_collision_layer_value(2, value)
