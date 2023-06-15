class_name Order
extends Panel

var label
var camera

func _ready():
	camera = get_viewport().get_camera_3d()
	label = get_node("Panel2").get_node("Text")

func set_text(msg):
	label.text = msg
	
func set_pos(world_pos, offset = Vector3.ZERO):
	var world_position = world_pos + offset
	var screen_position = camera.unproject_position(world_position)
	set_position(screen_position)
