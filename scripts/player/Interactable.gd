extends RigidBody3D

var prompt = preload("res://prompt.tscn").instantiate()

func _init():
	print(prompt)
	add_child(prompt)

func show_prompt(obj):
	var camera = get_viewport().get_camera_3d()
	var world_position = get_global_position()
	var screen_position = camera.unproject_position(world_position)
	prompt.set_position(screen_position)
