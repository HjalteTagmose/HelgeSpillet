class_name Subtitle
extends Label

var translated= ""
var orig_text = ""
var goal_text = ""
var temp_text = ""
var camera

var time_pr_letter = 0.1
var timer = 0

func _ready():
	get_node("/root/Global").switch_language.connect(on_switch_language)
	camera = get_viewport().get_camera_3d()
	set_pos(Vector3.ONE*1000)

func set_pos(world_pos, offset = Vector3.ZERO):
	var world_position = world_pos + offset
	var screen_position = camera.unproject_position(world_position)
	var size = get_minimum_size()
	set_position(screen_position - Vector2.RIGHT * size.x / 2)

func _process(delta):
	if timer >= time_pr_letter:
		timer = 0
		if temp_text.length() < goal_text.length():
			temp_text += goal_text[temp_text.length()]
			text = temp_text
	else:
		timer += delta

func update(dansk, english, speed = -1):
	time_pr_letter = speed if speed > 0 else .1
	orig_text = dansk
	translated= english
	temp_text = ""
	text = ""
	on_switch_language(Global.language)

func on_switch_language(language):
	text = ""
	set_size(Vector2(0,26))
	
	if language == Global.Language.Dansk:
		goal_text = orig_text
	else: 
		goal_text = translated
		
	temp_text = goal_text.substr(0, temp_text.length())
	text = temp_text
