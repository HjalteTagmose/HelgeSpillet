class_name Customer
extends PathFollow3D

@export var p = 0.0
var impeded = false

func _onready():
	var trigger = get_node("Trigger")
	trigger.body_entered.connect(on_body_entered)

func _process(delta):
	move(delta)
	
func move(delta):
	if impeded:
		return
	
	p += delta * 0.1
	if p >= 0.99:
		p = 1
	progress_ratio = p
	
func on_body_entered(body):
	impeded = true
	print("jaaj")
	
func on_body_exited(body):
	pass
