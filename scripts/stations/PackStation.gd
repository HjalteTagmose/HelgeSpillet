class_name PackStation
extends Station

var pakket_flæskesteg_prefab = preload("res://Meats/pakket_flæskesteg.tscn")
var pakket_svinekød_prefab = preload("res://Meats/pakket_hakket_flæsk.tscn")
var pakket_mørbrad_prefab = preload("res://Meats/pakket_mørbrad.tscn")

func use():
	super.use()
	if !can_use():
		return

	print("packing: ", occupant.type)
	match occupant.type:
		Meat.Type.MØRBRAD:
			spawn(pakket_mørbrad_prefab)
		Meat.Type.FLÆSKESTEG:
			spawn(pakket_flæskesteg_prefab)
		Meat.Type.HAKKET_SVINEKØD:
			print("pakket_svinekød")
			spawn(pakket_svinekød_prefab)

func can_use_item(item):
	return item.can_pack
