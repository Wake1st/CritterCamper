extends Area3D


@export var tent:Node3D


func _on_body_entered(body):
	if tent.blueprint:
		return
	
	display("sleep")
	print(body.name)
	body.nearTent = true
	body.sleepPosition = tent.sleepPosition
	body.exitPosition = tent.exitPosition


func _on_body_exited(body):
	if tent.blueprint:
		return
	
	display("")
	body.nearTent = false
	body.sleepPosition = Node3D.new()
	body.exitPosition = Node3D.new()


func display(msg:String):
	if msg == "":
		$UI/ClosestInteractable.visible = false
		$UI/ClosestInteractable.text = ""
	else:
		$UI/ClosestInteractable.visible = true
		$UI/ClosestInteractable.text = msg
