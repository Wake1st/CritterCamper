extends Control


var tentLabel = "TENT: "
var sleepingLabel = "SLEEP: "
var clockLabel = "CLOCK: "


func _ready():
	$Panel/VBoxContainer/Tent.text = tentLabel + "FALSE"
	$Panel/VBoxContainer/Sleeping.text = sleepingLabel + "FALSE"


func _on_build_point_placed_item(_pack, _transform):
	$Panel/VBoxContainer/Tent.text = tentLabel + "TRUE"


func _on_build_point_removed_item(_pack):
	$Panel/VBoxContainer/Tent.text = tentLabel + "FALSE"


func _on_character_asleep():
	$Panel/VBoxContainer/Sleeping.text = sleepingLabel + "TRUE"


func _on_character_awake():
	$Panel/VBoxContainer/Sleeping.text = sleepingLabel + "FALSE"


func _on_clock_time_tick(hour:int, minute:int):
	var extraZero = "0" if minute < 10 else ""
	var time = str(hour) + ":" + extraZero + str(minute)
	$Panel/VBoxContainer/Clock.text = clockLabel + time
