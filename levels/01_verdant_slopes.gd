extends Node3D


var gameManager:GameManager:
	set(value):
		gameManager = value
		$Entry.gameManager = gameManager


func _ready():
	$Player.global_position = $PlayerSpawn.global_position
