class_name Customer
extends PathFollow3D

signal on_leave

@export var order : Meat.Type
@export var prompt_offset : Vector3
@export var order_offset : Vector3
@export var start_time = 30.0

var prompt : Prompt = preload("res://Prefabs/prompt.tscn").instantiate()
var orderbox : Order = preload("res://Prefabs/order_box.tscn").instantiate()

var goal = 0
var speed = 3
var num = 0

var timer = Timer.new()

func _ready():
	timer.connect("timeout", time_out)
	timer.wait_time = start_time
	timer.one_shot = false
	add_child(timer)
	timer.start()
	
	var ui = get_tree().get_root().get_node("root").get_node("UI")
	ui.add_child(prompt)
	ui.add_child(orderbox)
	
	speed += randf_range(-0.1 * speed, 0.1 * speed)
	orderbox.set_meat_type(order)
	prompt.hide()

func _process(delta):
	move(delta)
	prompt.set_pos(global_position + prompt_offset)
	orderbox.set_pos(global_position+ order_offset)

	var progress = timer.get_time_left() / start_time * 100
	orderbox.set_progress(progress)

func move(delta):
	if goal > progress:
		progress += delta * speed

func wants(meat):
	return meat.type == order

func give(meat):
	get_node("/root/PointSystem").adjust_points(+20)
	print("got meat")
	meat.free()
	leave()
#	timer.stop()
#	timer.start(100)
#	print(timer.get_time_left())

func time_out():
	get_node("/root/PointSystem").adjust_points(-30)
	leave()

func leave():
	on_leave.emit(num)
	orderbox.queue_free()
	prompt.queue_free()
	timer.queue_free()
	queue_free()

func update_prompt(meat):
	if wants(meat):
		prompt.show()
	else:
		prompt.hide()

func hide_prompt():
	prompt.hide()
