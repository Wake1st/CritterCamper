extends Timer


const hourPerDay = 24


@export var startHour:float = 12
@export var wakeHour:float = 6


func _on_clock_set_sec_per_day(secPerHour:int):
	wait_time = secPerHour * (hourPerDay - startHour + wakeHour)
	start(wait_time)
