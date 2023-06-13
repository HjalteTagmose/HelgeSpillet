class_name GrindStation
extends Station

@export var spawn_point : Node3D
var hakket_flæsk_prefab = preload("res://Meats/hakket_flæsk.tscn")

func use():
	super.use()
	
	if !can_use():
		return

	var hakket_flæsk = hakket_flæsk_prefab.instantiate()
	hakket_flæsk.position = spawn_point.global_position
	get_tree().get_root().add_child(hakket_flæsk)
	occupant.free()

func can_use():
	return super.has_occupant() && can_use_item(occupant)

func can_use_item(item):
	return item.can_grind
