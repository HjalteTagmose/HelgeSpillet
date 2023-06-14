class_name Station
extends StaticBody3D

@export var place_point : Node3D
@export var prompt_offset : Vector3

var prompt : Prompt = preload("res://prompt.tscn").instantiate()
var trigger : Area3D
var occupant

func _ready():
	trigger = get_node("Trigger")
	trigger.body_entered.connect(on_body_entered)
	prompt.text = "Z"
	add_child(prompt)

func _process(delta):
	if !has_occupant():
		prompt.hide()
		return

	if occupant.is_held:
		occupant = null
		prompt.hide()
		return
		
	prompt.set_pos(global_position, prompt_offset)
	prompt.show()

func on_body_entered(body):
	if has_occupant():
		return

	if body.is_in_group("interactable") && !body.is_held && can_use_item(body):
		body.pickup(place_point)
		body.is_held = false
		body.freeze = false
		body.collision_layer = 1
		occupant = body

func use():
	print("using station: ", self)
	
func has_occupant():
#	print("occupant: ", occupant)
	return occupant != null

func can_use_item(item):
	return false
