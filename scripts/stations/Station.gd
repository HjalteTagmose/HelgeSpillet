class_name Station
extends Area3D

@export var place_point : Node3D
var occupant
var can_be_used = false

func _ready():
	body_entered.connect(on_body_entered)
	
func _process(delta):
	if !has_occupant():
		return
	
	if occupant.is_held:
		occupant = null
	
func on_body_entered(body):
	if has_occupant():
		return
	
	if body.is_in_group("interactable") && !body.is_held:
		body.pickup(place_point)
		body.is_held = false
		body.freeze = false
		body.collision_layer = 1
		occupant = body

func use():
	if !has_occupant():
		return
		
func has_occupant():
#	print("occupant: ", occupant)
	return occupant != null