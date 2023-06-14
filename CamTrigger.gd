extends Area3D

var camera
var speed = 5
var main_pos
var sec_pos = Vector3(0,1,0)

var end_pos
var go = false

func _ready():
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)
	camera = get_viewport().get_camera_3d()
	main_pos = camera.global_position
	end_pos = main_pos
	
func _process(delta):
	var t = clamp(delta * speed * 1 if go else -1, 0.0, 1.0)
	camera.global_position = lerp(camera.global_position, end_pos, t)
	pass
	
func on_body_entered(body):
	var name = body.name 
	end_pos = sec_pos
	if name.begins_with("Player"):
		print("move cam to: ", end_pos)
		go = true
		
func on_body_exited(body):
	var name = body.name 
	if name.begins_with("Player"):
		end_pos = main_pos
		print("move cam to: ", end_pos)
		go = false
