extends Node


@export var clock:Timer


func _ready():
	setup_animations($WorldEnvironment/AnimationPlayer)
	setup_animations($DirectionalLight3D/AnimationPlayer)


func setup_animations(anim:AnimationPlayer):
	anim.seek(clock.startHour)
	anim.speed_scale = 1.0/clock.secPerHour
