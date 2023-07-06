extends Node3D


var gameManager:GameManager


func _on_area_3d_body_entered(_body):
	gameManager.main_level()
