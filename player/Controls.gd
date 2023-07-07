class_name Controls
extends Node

var direction:= Vector3.ZERO
var rotation:= Vector2.ZERO

var action:bool = false
var undo:bool = false
var buildMode:bool = false


func _capture()->Controls:
	direction = Vector3.ZERO
	rotation = Vector2.ZERO
	
	direction.z += int(Input.is_action_pressed("backward")) - int(Input.is_action_pressed("forward"))
	direction.x += int(Input.is_action_pressed("right")) - int(Input.get_action_strength("left"))
	
	var viewport = get_viewport()
	var mousePos = viewport.get_mouse_position()
	var screenSize = viewport.get_visible_rect().size
	rotation.x = -(mousePos.x - screenSize.x / 2) / screenSize.x
	rotation.y = -(mousePos.y - screenSize.y / 2) / screenSize.y
	
	action = Input.is_action_just_pressed("action")
	undo = Input.is_action_just_pressed("undo_action")
	buildMode = Input.is_action_just_pressed("build")
	
	return self
