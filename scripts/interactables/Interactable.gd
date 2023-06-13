class_name Interactable 
extends RigidBody3D

var prompt : Prompt = preload("res://prompt.tscn").instantiate()

func _init():
	print(prompt)
	add_child(prompt)
	
func interact(point):
	hide_prompt()

func show_prompt():
	var camera = get_viewport().get_camera_3d()
	var world_position = get_global_position()
	var screen_position = camera.unproject_position(world_position)
	prompt.set_position(screen_position)
	prompt.show() 

func hide_prompt():
	prompt.hide()
