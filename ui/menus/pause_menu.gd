extends Control


@export var gameManager:GameManager


func _ready():
	hide()
	gameManager.connect("toggle_pause", _on_game_manager_toggle_pause)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_resume_pressed():
	gameManager.paused = false


func _on_options_pressed():
	print("TODO: init")


func _on_menu_pressed():
	gameManager.main_level()


func _on_quit_pressed():
	get_tree().quit()


func _on_game_manager_toggle_pause(pausing:bool):
	if pausing:
		show()
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
		$VBoxContainer/Resume.grab_focus()
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		hide()
