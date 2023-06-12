extends RigidBody3D

var prompt = preload("res://prompt.tscn").instantiate()

func _init():
	print(prompt)
	add_child(prompt)

func interact(point):
	reparent(point)
	global_position = point.global_position
	freeze = true
	collision_layer = 0

func drop():
	reparent(get_tree().root)
	freeze = false
	collision_layer = 1

func show_prompt():
	var camera = get_viewport().get_camera_3d()
	var world_position = get_global_position()
	var screen_position = camera.unproject_position(world_position)
	prompt.set_position(screen_position)

func hide_prompt():
	prompt.set_position(Vector2(-9999,9999))

