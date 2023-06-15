class_name Prompt
extends Label

var camera
var a
var x

func _ready():
	a = get_node("A")
	x = get_node("X")
	camera = get_viewport().get_camera_3d()

func set_use():
	a.visible = false
	x.visible = true
	pass
	
func set_interact():
	a.visible = true
	x.visible = false
	pass

func set_button_text(msg):
	a.get_node("Label").set_text(msg)
	x.get_node("Label").set_text(msg)

func set_pos(world_pos, offset = Vector3.ZERO):
	var world_position = world_pos + offset
	var screen_position = camera.unproject_position(world_position)
	set_position(screen_position)
