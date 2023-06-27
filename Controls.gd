class_name Controls
extends Node

var direction:= Vector3.ZERO
var rotation:= Vector2.ZERO


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
	
	return self
