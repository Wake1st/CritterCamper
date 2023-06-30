extends CharacterBody3D


signal asleep
signal awake


@export var speed:float = 280.0
@export var rotMag:= Vector2(1.2,6.0)

@export var cameraPivotMin:float = -30.0
@export var cameraPivotMax:float = 40.0

@export var controlCapture:Controls


var sleeping:= false:
	get:
		return sleeping
	set(value):
		sleeping = value
		if sleeping:
			emit_signal("asleep")
			Engine.time_scale = 60
		else:
			emit_signal("awake")
			Engine.time_scale = 1


func _physics_process(delta):
	var controls = controlCapture._capture()
	
	if controls.sleep:
		sleeping = !sleeping
	
	if sleeping:
		return
	
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
			%BuildPoint.placing = false
		else:
			%BuildPoint.placing = true
	
	if controls.undo:
		if %BuildPoint.placing:
			%BuildPoint.placing = false


func _on_alarm_timeout():
	sleeping = false
