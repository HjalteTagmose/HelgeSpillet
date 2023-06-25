extends Interactable

signal spawned_meat

@export var spawnType : Meat.Type
var flæsk_prefab = preload("res://Prefabs/Meats/flæsk.tscn")
var mørbrad_prefab = preload("res://Prefabs/Meats/mørbrad.tscn")
var spegepøls_prefab = preload("res://Prefabs/Meats/spegepølse.tscn")

func pickup(point):
	return spawn(point)

func _process(delta):
	if prompt_on:
		prompt.set_pos(global_position, offset)

func spawn(point):
	var prefab = null
	match spawnType:
		Meat.Type.MØRBRAD:
			prefab = mørbrad_prefab
		Meat.Type.FLÆSK:
			prefab = flæsk_prefab
		Meat.Type.SPEGEPØLSE:
			prefab = spegepøls_prefab
	
	if prefab == null:
		print("CANT SPAWN ", spawnType)

	var obj = prefab.instantiate()
	point.add_child(obj)
	obj.pickup(point)
	spawned_meat.emit(0)
	return obj
