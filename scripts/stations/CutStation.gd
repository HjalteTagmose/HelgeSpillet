class_name CutStation
extends Station

var flæskesteg_prefab = preload("res://Prefabs/Meats/flæskesteg.tscn")

func use():
	if !can_use():
		return
	super.use()
	spawn(flæskesteg_prefab)
	
func can_use_item(item):
	return item.can_cut
