class_name Pickupable
extends Interactable

func interact(point):
	super(point)
	reparent(point)
	global_position = point.global_position
	freeze = true
	collision_layer = 0

func drop():
	reparent(get_tree().root)
	freeze = false
	collision_layer = 1
