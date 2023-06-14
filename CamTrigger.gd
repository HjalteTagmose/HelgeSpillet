extends Area3D

var camera
var speed = 2.5
var main_pos
@export var sec_pos : Vector3

var end_pos
var go = false

func _ready():
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)
	camera = get_viewport().get_camera_3d()
	main_pos = camera.global_position
	end_pos = main_pos
	
func _process(delta):
	var t = (delta * speed)
	camera.global_position = lerp(camera.global_position, end_pos, t)
	pass
	
func on_body_entered(body):
	if body.name.begins_with("Player"):
		end_pos = sec_pos
		print("move cam to: ", end_pos)
		go = true
		
func on_body_exited(body):
	if body.name.begins_with("Player"):
		end_pos = main_pos
		print("move cam to: ", end_pos)
		go = false
