class_name Interact
extends Area3D

signal picked_up_meat
signal dropped_meat

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

func _process(_delta):
	var customer = get_first_overlap_in_group("customer")
	if customer != null && holding_object():
		customer = customer.get_parent()
		customer.update_prompt(held_obj)
		
	if Input.is_action_just_pressed("interact"):
		if holding_object():
			if customer != null:
				if customer.wants(held_obj):
					customer.give(held_obj)
			drop()
		else:
			var body = get_first_overlap_in_group("interactable")
			if body != null:
				interact(body)
				return

	if Input.is_action_just_pressed("use"):
		if holding_object():
			return

		var body = get_first_overlap_in_group("usable")
		print(body)
		if body != null:
			use(body)
			print(body)

func interact(interactable):
	if holding_object():
		return
	
	var obj = interactable.pickup(pickup_point)
	picked_up_meat.emit(interactable)
	held_obj = obj
	print("pickup: ", obj)

func drop():
	print("drop: ", held_obj)
	dropped_meat.emit()
	if held_obj == null:
		held_obj = null
		return
	held_obj.drop()
	held_obj = null

func use(usable):
	usable.use()

func holding_object():
	return held_obj != null
	
func get_first_overlap_in_group(group):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group(group):
			return body
	return null
