class_name Prompt
extends Label

var camera
var a
var x

var orig_text

func _ready():
	get_node("/root/Global").switch_language.connect(on_switch_language)
	a = get_node("A")
	x = get_node("X")
	camera = get_viewport().get_camera_3d()
	set_pos(Vector3.ONE*1000)

func set_use():
	a.visible = false
	x.visible = true

func set_interact():
	a.visible = true
	x.visible = false

func set_button_text(msg):
	a.get_node("Label").set_text(msg)
	x.get_node("Label").set_text(msg)
	
	if orig_text == null:
		orig_text = msg
		on_switch_language(Global.language)
		

func set_pos(world_pos, offset = Vector3.ZERO):
	var world_position = world_pos + offset
	var screen_position = camera.unproject_position(world_position)
	set_position(screen_position)

func on_switch_language(language):
	if language == Global.Language.Dansk:
		set_button_text(orig_text)
	else: 
		var english = Global.translate(orig_text)
		set_button_text(english)
