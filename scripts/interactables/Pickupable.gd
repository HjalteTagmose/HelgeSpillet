class_name Pickupable 
extends Interactable

var is_held = false

func setup_prompt():
	await super.setup_prompt()
	prompt.set_button_text("Saml op")

func pickup(point):
	super.interact(point)
	is_held = true
	reparent(point)
	global_position = point.global_position
	global_rotation = point.global_rotation
	freeze = true
	collision_layer = 0
	return self

func drop():
	is_held = false
	reparent(get_tree().root)
	freeze = false
	collision_layer = 1
