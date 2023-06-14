class_name Prompt
extends Label

var camera

func _ready():
	camera = get_viewport().get_camera_3d()
	
func set_pos(world_pos, offset = Vector3.ZERO):
	var world_position = world_pos + offset
	var screen_position = camera.unproject_position(world_position)
	set_position(screen_position)
