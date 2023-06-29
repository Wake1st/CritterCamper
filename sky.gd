extends Node


@export var startHour:float = 12.0
@export var secPerHour:float = 60.0


func _ready():
	setup_animations($WorldEnvironment/AnimationPlayer)
	setup_animations($DirectionalLight3D/AnimationPlayer)


func setup_animations(anim:AnimationPlayer):
	anim.seek(startHour)
	anim.speed_scale = 1.0/secPerHour
