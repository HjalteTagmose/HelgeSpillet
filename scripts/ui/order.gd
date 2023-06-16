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

var flæsksteg = preload("res://Assets/UI/t_PakketFlæskesteg.png")
var spegepøls = preload("res://Assets/UI/t_Spegepøls.png")
var mørbraddd = preload("res://Assets/UI/t_PakketMørbrad.png")
var svinekød  = preload("res://Assets/UI/t_PakketKød.png")

func _ready():
	camera = get_viewport().get_camera_3d()
	label = get_node("Holder").get_node("Text")
	image = get_node("Image2")
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
	match meat_type:
		Meat.Type.PAKKET_MØRBRAD:
			image.texture = mørbraddd
		Meat.Type.PAKKET_FLÆSKESTEG:
			image.texture = flæsksteg
		Meat.Type.PAKKET_SVINEKØD:
			image.texture = svinekød
		Meat.Type.SPEGEPØLSE:
			image.texture = spegepøls

func set_pos(world_pos, offset = Vector3.ZERO):
	var world_position = world_pos + offset
	var screen_position = camera.unproject_position(world_position)
	set_position(screen_position)
