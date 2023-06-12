extends Area3D

var held_obj

func _ready():
	body_entered.connect(on_body_entered)
	
func on_body_entered(body):
	if held_obj != null:
		return
	
	if body.is_in_group("pickupable"):
		print("pickupable entered the trigger area.")
