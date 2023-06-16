class_name GrindStation
extends Station

var hakket_flæsk_prefab = preload("res://Prefabs/Meats/hakket_flæsk.tscn")

func use():
	if !can_use():
		return
	super.use()
	spawn(hakket_flæsk_prefab)
	SfxManager.play_sfx(SfxManager.SFX.KØDHAKKER)

func can_use_item(item):
	return item.can_grind
