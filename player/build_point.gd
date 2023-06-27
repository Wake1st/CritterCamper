extends Node3D


signal placed_item(pack:PackedScene, point:Node3D)
signal remove_item(pack:PackedScene, point:Node3D)


@export var pack:PackedScene
var silhouette:Node3D

var placed:=false:
	get:
		return placed
	set(value):
		placed = value
		if value:
			emit_signal("placed_item", pack, global_position)
		else:
			emit_signal("remove_item", pack, global_position)


func _ready():
	silhouette = pack.instantiate()
