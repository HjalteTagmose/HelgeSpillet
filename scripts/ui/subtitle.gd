extends Label

var orig_text
var camera

func _ready():
	get_node("/root/Global").switch_language.connect(on_switch_language)
	camera = get_viewport().get_camera_3d()
	set_pos(Vector3.ONE*1000)

func set_pos(world_pos, offset = Vector3.ZERO):
	var world_position = world_pos + offset
	var screen_position = camera.unproject_position(world_position)
	var size = get_minimum_size()
	set_position(screen_position - Vector2.RIGHT * size.x / 2)

func update(msg):
	orig_text = msg
	text = msg

func on_switch_language():
	pass
