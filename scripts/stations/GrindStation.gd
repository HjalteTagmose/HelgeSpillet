class_name GrindStation
extends Station

var hakket_flæsk_prefab = preload("res://Meats/hakket_flæsk.tscn")

func use():
	super.use()
	
	if !can_use():
		return
		
	var hakket_flæsk = hakket_flæsk_prefab.instantiate()
	hakket_flæsk.position = occupant.global_position
	get_tree().get_root().add_child(hakket_flæsk)
	occupant.free()

func can_use():
	return super.has_occupant() && occupant.can_cut
	
func can_use_item(item):
	return item.can_cut
