extends Control


@export var gameManager:GameManager


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	$VBoxContainer/Start.grab_focus()


func _on_start_pressed():
	gameManager.select_level("res://levels/01_verdant_slopes.tscn")
	hide()


func _on_options_pressed():
	print('TODO: implement')


func _on_quit_pressed():
	get_tree().quit()
