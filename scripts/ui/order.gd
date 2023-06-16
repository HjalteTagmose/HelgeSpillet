class_name Order
extends Panel

signal time_danger
@export var timer_color_ok : Color
@export var timer_color_warning : Color
@export var timer_color_danger : Color

var label
var image
var camera
var progress: TextureProgressBar
var announced_danger = false

func _ready():
	camera = get_viewport().get_camera_3d()
	label = get_node("Holder").get_node("Text")
	image = get_node("Holder").get_node("Image")
	progress = get_node("TimerBar") 

func set_progress(p):
	progress.value = p
	if p < 35:
		progress.tint_progress = timer_color_danger
	elif p < 65:
		progress.tint_progress = timer_color_warning
	else:
		progress.tint_progress = timer_color_ok
		
	if p < 35 && !announced_danger:
		announced_danger = true
		time_danger.emit()

func set_meat_type(meat_type: Meat.Type):
	label.text = Meat.Type.keys()[meat_type]
	
func set_pos(world_pos, offset = Vector3.ZERO):
	var world_position = world_pos + offset
	var screen_position = camera.unproject_position(world_position)
	set_position(screen_position)
