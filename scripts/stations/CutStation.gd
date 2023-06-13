class_name CutStation
extends Area3D

@export var place_point : Node3D
var is_full = false

func _ready():
	body_entered.connect(on_body_entered)
	
func on_body_entered(body):
	if body.is_in_group("interactable") && !body.is_held:
		body.pickup(place_point)
		body.is_held = false
		body.freeze = false
		body.collision_layer = 1
		is_full = true