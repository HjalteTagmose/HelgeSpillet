extends Area3D

var held_obj
var pickup_point

func _ready():
	pickup_point = get_node("Pickup")
	
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		print("interact")
		
		if held_obj != null:
			drop()
		
		var bodies = get_overlapping_bodies()
		for body in bodies:
			print(body)
			if body.is_in_group("interactable"):
				interact(body)

func interact(body):
	print("pickup: ", held_obj)
	held_obj = body
	body.reparent(self)
	body.position = pickup_point.position
	body.freeze = true
	body.collision_layer = 0

func drop():
	print("drop: ", held_obj)
	held_obj.reparent(get_tree().root)
	held_obj.freeze = false
	held_obj.collision_layer = 1
	held_obj = null
