class_name Pickupable extends Interactable

var is_held = false

func pickup(point):
	super.interact(point)
	is_held = true
	reparent(point)
	global_position = point.global_position
	freeze = true
	collision_layer = 0

func drop():
	is_held = false
	reparent(get_tree().root)
	freeze = false
	collision_layer = 1
