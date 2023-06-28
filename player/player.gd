extends CharacterBody3D


@export var speed:float = 280.0
@export var rotMag:= Vector2(1.2,6.0)

@export var cameraPivotMin:float = -30.0
@export var cameraPivotMax:float = 40.0

@export var controlCapture:Controls


func _physics_process(delta):
	var controls = controlCapture._capture()
	
	rotation.y = controls.rotation.x * rotMag.y
	$CameraPivot.rotation.x = controls.rotation.y * rotMag.x
	$CameraPivot.rotation_degrees.x = clamp(
		$CameraPivot.rotation_degrees.x,
		cameraPivotMin,
		cameraPivotMax
	)
	
	velocity = global_transform.basis * controls.direction * speed * delta
	move_and_slide()
	
	if controls.action:
		if %BuildPoint.placing:
			var placed = !%BuildPoint.placed
			%BuildPoint.placed = placed
			%BuildPoint.placing = !placed
		else:
			%BuildPoint.placing = true
	
	if controls.undo:
		if %BuildPoint.placing:
			%BuildPoint.placing = false
