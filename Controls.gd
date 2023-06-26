class_name Controls
extends Node

var direction:= Vector3.ZERO
var rotation:= Vector2.ZERO

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


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
	
#	rotation.x = rotation_limiter(rotation.x,0.02,0.2)
#	rotation.y = rotation_limiter(rotation.y,0.03,0.3)
	
	return self


func rotation_limiter(rot:float,minLimit:float,maxLimit:float)->float:
	if rot > minLimit or rot < -minLimit:
		return clampf(
			rot,
			-maxLimit,
			maxLimit,
		)
	else:
		return 0.0
