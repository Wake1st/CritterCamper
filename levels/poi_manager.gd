extends Node3D


@export var player:CharacterBody3D

var pointsOfInterest:Dictionary


func _physics_process(_delta):
	pointsOfInterest[player.name] = player.global_position


func get_pois():
	return pointsOfInterest.values()
