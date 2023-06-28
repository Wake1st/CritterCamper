extends Node3D


var items:Dictionary


func _on_build_point_placed_item(scene:PackedScene,tran:Transform3D):
	var item = scene.instantiate() as Node3D
	add_child(item)
	item.global_transform = tran
	items[scene.resource_name] = item


func _on_build_point_removed_item(scene:PackedScene):
	var n = items[scene.resource_name]
	remove_child(n)
