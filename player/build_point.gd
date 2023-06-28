extends Node3D


signal placed_item(pack:PackedScene, transform:Transform3D)
signal removed_item(pack:PackedScene)

@export var buildSilhouette:StandardMaterial3D
@export var pack:PackedScene
var silhouette:Node3D

var placed:=false:
	get:
		return placed
	set(value):
		placed = value
		if value:
			emit_signal("placed_item", pack, global_transform)
		else:
			emit_signal("removed_item", pack)


var placing:=false:
	get:
		return placing
	set(value):
		placing = value
		if placing:
			add_child(silhouette)
		else:
			remove_child(silhouette)


func _ready():
	silhouette = pack.instantiate()
	silhouette.get_child(0).set_surface_override_material(0,buildSilhouette)
