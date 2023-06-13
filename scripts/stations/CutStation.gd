class_name CutStation
extends Station

var flæskesteg_prefab = preload("res://Meats/flæskesteg.tscn")

func use():
	super.use()
	
	if !can_use():
		return
		
	var flæskesteg = flæskesteg_prefab.instantiate()
	flæskesteg.position = occupant.global_position
	get_tree().get_root().add_child(flæskesteg)
	occupant.free()

func can_use():
	return super.has_occupant() && occupant.can_cut
	
func can_use_item(item):
	return item.can_cut
