extends Area3D

var held_obj
var pickup_point

func _ready():
	pickup_point = get_node("Pickup")
	
func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("interactable"):
			var interactable = body
			interactable.show_prompt(interactable)
	
	if Input.is_action_just_pressed("interact"):
#		interact()
		print("interact")
		
		if held_obj != null:
			drop()

func interact(interactable):
	interactable.pickup(self)
	held_obj = interactable
	print("pickup: ", held_obj)

func drop():
	held_obj.drop()
	held_obj = null
	print("drop: ", held_obj)
