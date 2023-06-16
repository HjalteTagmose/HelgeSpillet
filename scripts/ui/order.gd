class_name Order
extends Panel

@export var timer_color_ok : Color
@export var timer_color_warning : Color
@export var timer_color_danger : Color

var label
var image
var camera
var progress: TextureProgressBar

func _ready():
	camera = get_viewport().get_camera_3d()
	label = get_node("Holder").get_node("Text")
	image = get_node("Holder").get_node("Image")
	progress = get_node("TimerBar") 

func set_progress(p):
	progress.value = p
	if progress.value < 35:
		progress.tint_progress = timer_color_danger
	elif progress.value < 65:
		progress.tint_progress = timer_color_warning
	else:
		progress.tint_progress = timer_color_ok

func set_meat_type(meat_type: Meat.Type):
	label.text = Meat.Type.keys()[meat_type]
	
func set_pos(world_pos, offset = Vector3.ZERO):
	var world_position = world_pos + offset
	var screen_position = camera.unproject_position(world_position)
	set_position(screen_position)
