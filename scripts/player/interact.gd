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
			var body = get_first_overlap_in_group("interactable")
			if body != null:
				interact(body)

	if Input.is_action_just_pressed("use"):
		if holding_object():
			return

		var body = get_first_overlap_in_group("usable")
		print(body)
		if body != null:
			use(body)

func interact(interactable):
	if holding_object():
		return
	
	print("pickup: ", interactable)
	interactable.pickup(pickup_point)
	held_obj = interactable

func drop():
	print("drop: ", held_obj)
	held_obj.drop()
	held_obj = null

func use(usable):
	print("tried to use: ", usable)

func holding_object():
	return held_obj != null
	
func get_first_overlap_in_group(group):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group(group):
			return body
	return null
