class_name Customer
extends PathFollow3D

signal on_leave

@export var order : Meat.Type
@export var prompt_offset : Vector3
@export var order_offset : Vector3
var prompt : Prompt = preload("res://Prefabs/prompt.tscn").instantiate()
var orderbox : Order = preload("res://Prefabs/order_box.tscn").instantiate()

var goal = 0
var speed = 3
var num = 0

func _ready():
#bullshit
#	var interaction = get_tree().get_root().get_node("root").get_node("Player").get_node("Interaction")
#	interaction.picked_up_meat.connect(update_prompt)
#	interaction.dropped_meat.connect(prompt.hide)

	var ui = get_tree().get_root().get_node("root").get_node("UI")
	ui.add_child(prompt)
	ui.add_child(orderbox)
	
	speed += randf_range(-0.1 * speed, 0.1 * speed)
	orderbox.set_text(Meat.Type.keys()[order])
	prompt.hide()

func _process(delta):
	move(delta)
	prompt.set_pos(global_position + prompt_offset)
	orderbox.set_pos(global_position+ order_offset)

func move(delta):
	if goal > progress:
		progress += delta * speed

func wants(meat):
	return meat.type == order

func give(meat):
	print("got meat")
	meat.free()
	leave()

func leave():
	on_leave.emit(num)
	orderbox.queue_free()
	prompt.queue_free()
	queue_free()

func update_prompt(meat):
	if wants(meat):
		prompt.show()
	else:
		prompt.hide()
