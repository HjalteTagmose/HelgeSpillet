class_name Interact
extends Area3D

var held_obj
var pickup_point

func _ready():
	pickup_point = get_node("Pickup")
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)

func on_body_entered(body):
	if body.is_in_group("interactable") && !holding_object():
		body.show_prompt()
	
func on_body_exited(body):
	if body.is_in_group("interactable"):
		body.hide_prompt()

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		if holding_object():
			drop()
		else:
			var bodies = get_overlapping_bodies()
			for body in bodies:
				if body.is_in_group("interactable"):
					interact(body)

func interact(interactable):
	print("pickup: ", interactable)
	interactable.pickup(pickup_point)
	held_obj = interactable

func drop():
	print("drop: ", held_obj)
	held_obj.drop()
	held_obj = null

func holding_object():
	return held_obj != null
