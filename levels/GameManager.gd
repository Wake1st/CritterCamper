class_name GameManager
extends Node


signal toggle_pause(pausing:bool)


@export var pauseMenu:PackedScene
@export var mainMenu:PackedScene

var currentMenu:Control
var currentLevel:Node3D

var paused:= false:
	get:
		return paused
	set(value):
		paused = value
		get_tree().paused = paused
		emit_signal("toggle_pause", paused)


func _ready():
	currentLevel = get_child(0)
	currentMenu = $CanvasLayer.get_child(0)


func _input(event:InputEvent):
	if event.is_action_pressed("ui_cancel"):
		paused = !paused


func select_level(file:String):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	reset_level(file,pauseMenu)
	currentLevel.gameManager = self


func main_level():
	reset_level("res://levels/00_main_level.tscn",mainMenu)
	paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)


func reset_level(file:String,menu:PackedScene):
	call_deferred("remove_child", currentLevel)
	currentLevel = load(file).instantiate()
	add_child(currentLevel)
	
	%CanvasLayer.remove_child(currentMenu)
	currentMenu = menu.instantiate()
	currentMenu.gameManager = self
	%CanvasLayer.add_child(currentMenu)
