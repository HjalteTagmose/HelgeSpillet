class_name GrindStation
extends Station

var hakket_flæsk_prefab = preload("res://Prefabs/Meats/hakket_flæsk.tscn")

func use():
	super.use()
	if !can_use():
		return
	spawn(hakket_flæsk_prefab)

func can_use_item(item):
	return item.can_grind
