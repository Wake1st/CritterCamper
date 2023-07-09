extends CharacterBody3D


signal asleep
signal awake


@export var speed:float = 280.0
@export var rotMag:= Vector2(1.2,6.0)

@export var cameraPivotMin:float = -30.0
@export var cameraPivotMax:float = 40.0

@export var controlCapture:Controls

var nearTent:=false
var sleepPosition:Node3D
var exitPosition:Node3D


var sleeping:= false:
	get:
		return sleeping
	set(value):
		sleeping = value
		if sleeping:
			emit_signal("asleep")
			global_position = sleepPosition.global_position
			transform.basis = transform.basis.orthonormalized()
			Engine.time_scale = 60
		else:
			emit_signal("awake")
			global_position = exitPosition.global_position
			transform.basis = transform.basis.orthonormalized()
			Engine.time_scale = 1


func _physics_process(delta):
	var controls = controlCapture._capture()
	
	if sleeping:
		if controls.action:
			sleeping = false
		else:
			return
	else:
		move_player(delta, controls)
		
		build(controls)
		
		if nearTent and controls.action:
			sleeping = true


func move_player(delta:float, controls:Controls):
	rotation.y = controls.rotation.x * rotMag.y
	$CameraPivot.rotation.x = controls.rotation.y * rotMag.x
	$CameraPivot.rotation_degrees.x = clamp(
		$CameraPivot.rotation_degrees.x,
		cameraPivotMin,
		cameraPivotMax
	)
	
	velocity = global_transform.basis * controls.direction * speed * delta
	move_and_slide()


func build(controls:Controls):
	if controls.buildMode:
		%BuildPoint.placing = !%BuildPoint.placing
	
	if %BuildPoint.placing == true:
		if controls.action:
			%BuildPoint.placed = true
		
		if controls.undo:
			%BuildPoint.placed = false


func _on_alarm_timeout():
	sleeping = false
