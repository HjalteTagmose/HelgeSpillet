class_name Order
extends Panel

var label
var image
var camera
var progress

func _ready():
	camera = get_viewport().get_camera_3d()
	label = get_node("Holder").get_node("Text")
	image = get_node("Holder").get_node("Image")
	progress = get_node("TimerBar")

func set_progress(p):
	progress.value = p

func set_meat_type(meat_type: Meat.Type):
	label.text = Meat.Type.keys()[meat_type]
	
func set_pos(world_pos, offset = Vector3.ZERO):
	var world_position = world_pos + offset
	var screen_position = camera.unproject_position(world_position)
	set_position(screen_position)
