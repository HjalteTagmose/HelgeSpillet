class_name Customer
extends PathFollow3D

signal on_leave

@export var order : Meat.Type
@export var prompt_offset : Vector3
@export var order_offset : Vector3
@export var start_time = 30.0

var prompt : Prompt = preload("res://Prefabs/prompt.tscn").instantiate()
var orderbox : Order = preload("res://Prefabs/order_box.tscn").instantiate()
var subtitle : Subtitle = preload("res://Prefabs/subtitle.tscn").instantiate()

var goal = 0
var speed = 3
var num = 0

var point_system
var timer = Timer.new()

func _ready():
	setup_mesh()
	point_system = get_node("/root/PointSystem")
	var ui = get_tree().get_root().get_node("root").get_node("UI")
	ui.add_child(orderbox)
	add_child(subtitle)
	add_child(prompt)
	orderbox.time_danger.connect(bark_hurry)
	speed += randf_range(-0.1 * speed, 0.1 * speed)
	prompt.hide()
	await get_tree().create_timer(0.1).timeout
	prompt.set_interact()
	prompt.set_button_text("Giv")

func setup(my_order, my_time):
	start_time = my_time
	order = my_order
	# create timer
	timer.connect("timeout", time_out)
	timer.wait_time = start_time
	timer.one_shot = false
	add_child(timer)
	timer.start()
	# update order
	orderbox.set_meat_type(order)

func _process(delta):
	move(delta)
	prompt.set_pos(global_position + prompt_offset)
	orderbox.set_pos(global_position+ order_offset)
	subtitle.set_pos(global_position + Vector3.UP * 2)

	var pct = timer.get_time_left() / start_time * 100
	orderbox.set_progress(pct)

func move(delta):
	if goal > progress:
		progress += delta * speed

func wants(meat):
	return meat.type == order

func give(meat):
	point_system.add_points(meat.type)
	print("got meat")
	meat.free()
	leave()
#	timer.stop()
#	timer.start(100)
#	print(timer.get_time_left())

func time_out():
	point_system.adjust_points(-150)
	leave()

func leave():
	on_leave.emit(num)
	subtitle.queue_free()
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

func bark_hurry():
	print("bark")
	LineManager.speak(subtitle, LineManager.Line.HVORDAN_MED_MØRBRAD)


# VISUALS
@export var kunde_mat_1 : Material
@export var kunde_mat_2 : Material
@export var kunde_mat_3 : Material
@export var kunde_mat_4 : Material
@export var tilbehør_mat_1 : Material
@export var tilbehør_mat_2 : Material
@export var tilbehør_mat_3 : Material
@export var tilbehør_mat_4 : Material

func setup_mesh():
	var Krop 		= get_node("Mesh/RootNode/Krop")
	var Hoved 		= get_node("Mesh/RootNode/Hoved")
	var HøjreHånd 	= get_node("Mesh/RootNode/HøjreHånd")
	var VenstreHånd = get_node("Mesh/RootNode/VenstreHånd")
	var Brilleglas 	= get_node("Mesh/RootNode/Brilleglas")
	var Halstørklæde= get_node("Mesh/RootNode/Halstørklæde")
	var Hue 		= get_node("Mesh/RootNode/Hue")

	Krop.set_surface_override_material(0, get_random_kunde_mat())
	Hoved.set_surface_override_material(0, get_random_kunde_mat())
	HøjreHånd.set_surface_override_material(0, get_random_kunde_mat())
	VenstreHånd.set_surface_override_material(0, get_random_kunde_mat())
	Brilleglas.set_surface_override_material(0, get_random_tilbehør_mat())
	Halstørklæde.set_surface_override_material(0, get_random_tilbehør_mat())
	Hue.set_surface_override_material(0, get_random_tilbehør_mat())

func get_random_kunde_mat():
	var m = randf()
	if m < .25:
		return kunde_mat_1
	elif m < .5:
		return kunde_mat_2
	elif m < .75:
		return kunde_mat_3
	else:
		return kunde_mat_4

func get_random_tilbehør_mat():
	var m = randf()
	if m < .25:
		return tilbehør_mat_1
	elif m < .5:
		return tilbehør_mat_2
	elif m < .75:
		return tilbehør_mat_3
	else:
		return tilbehør_mat_4
