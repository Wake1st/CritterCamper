extends Node3D


var blueprint:= true


var sleepPosition:Node3D:
	get:
		sleepPosition = $SleepPosition
		return sleepPosition


var exitPosition:Node3D:
	get:
		exitPosition = $ExitPosition
		return exitPosition
