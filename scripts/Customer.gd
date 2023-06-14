class_name Customer
extends PathFollow3D

@export var order : Meat.Type
var prompt : Prompt = preload("res://prompt.tscn").instantiate()

var goal = 0
var speed = 3

func _ready():
	var interaction = get_tree().get_root().get_node("root").get_node("Player").get_node("Interaction")
	interaction.picked_up_meat.connect(update_prompt)
	interaction.dropped_meat.connect(prompt.hide)
	
	speed += randf_range(-0.1 * speed, 0.1 * speed)
	add_child(prompt)
	prompt.hide()

func _process(delta):
	move(delta)
	prompt.set_pos(global_position + Vector3.UP * 2)

func move(delta):
	if goal > progress:
		progress += delta * speed

func wants(meat):
	return meat.type == order

func give(meat):
	print("got meat")
	meat.free()
	self.free()

func update_prompt(meat):
	if wants(meat):
		prompt.show()
	else:
		prompt.hide()
