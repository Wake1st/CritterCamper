extends Area3D


var interactables:Dictionary


func _on_body_entered(body):
	var interactable = body.get_parent()
	interactables[interactable.name] = interactable


func _on_body_exited(body):
	var interactable = body.get_parent()
	interactables[interactable.name] = null
