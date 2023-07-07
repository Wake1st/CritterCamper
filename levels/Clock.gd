extends Timer


signal setSecPerDay(secPerHour:int)
signal time_tick(hour:int,minute:int)


const hourPerDay:float = 24


@export var startHour:float = 12.0
@export var secPerHour:float = 60.0
var secPerDay:float

@export var tickSec:float = 5.0
var tickGap:float = 0.0


func _ready():
	secPerDay = hourPerDay * secPerHour
	emit_signal("setSecPerDay", secPerHour)
	
	wait_time = (hourPerDay - startHour) * secPerHour
	start(wait_time)


func _physics_process(delta):
	tickGap += delta
	if tickGap > tickSec:
		tickGap = 0.0
		
		var timeLeft = (ceili(time_left)/secPerDay)*hourPerDay
		
		var hoursLeft = int(timeLeft)
		hoursLeft = 12 if hoursLeft == 0 else hoursLeft
		var currentHour = int(hourPerDay - 1 - hoursLeft) % int(hourPerDay/2)
		
		var nearest12Hour = 12 if currentHour == 0 else currentHour
		
		var roundedMin = secPerHour - int(fmod(timeLeft, hoursLeft) * secPerHour)
		var nearest5Min = int(roundedMin/5) * 5
		
		emit_signal("time_tick", nearest12Hour, nearest5Min)


func _on_timeout():
	start(secPerDay)
