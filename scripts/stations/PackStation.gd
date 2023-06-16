class_name PackStation
extends Station

var pakket_flæskesteg_prefab = preload("res://Prefabs/Meats/pakket_flæskesteg.tscn")
var pakket_svinekød_prefab = preload("res://Prefabs/Meats/pakket_hakket_flæsk.tscn")
var pakket_mørbrad_prefab = preload("res://Prefabs/Meats/pakket_mørbrad.tscn")

func use():
	if !can_use():
		return
	super.use()
	print("packing: ", occupant.type)
	match occupant.type:
		Meat.Type.MØRBRAD:
			spawn(pakket_mørbrad_prefab)
		Meat.Type.FLÆSKESTEG:
			spawn(pakket_flæskesteg_prefab)
		Meat.Type.HAKKET_SVINEKØD:
			print("pakket_svinekød")
			spawn(pakket_svinekød_prefab)

	SfxManager.play_sfx(SfxManager.SFX.PAK)

func can_use_item(item):
	return item.can_pack
