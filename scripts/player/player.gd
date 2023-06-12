extends CharacterBody3D

const SPEED = 5.0
const ACCELERATION = 10
const JUMP_VELOCITY = 4.5
const ANGULAR_ACCELERATION = 10

var rot = 0.0
var target_rot = 0.0
var target_speed_x = 0.0
var target_speed_z = 0.0

var mesh : Node3D
var interact : Node3D

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	mesh = get_node("Mesh")
	interact = get_node("Interaction")

func _physics_process(delta):
	move(delta)

func move(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		target_speed_x = direction.x * SPEED
		target_speed_z = direction.z * SPEED
		target_rot = atan2(direction.x, direction.z)
	else:
		target_speed_x = 0.0
		target_speed_z = 0.0
	
	velocity.x = lerp(velocity.x, target_speed_x, delta * ACCELERATION); 
	velocity.z = lerp(velocity.z, target_speed_z, delta * ACCELERATION); 
	rot = lerp_angle(rot, target_rot, delta * ANGULAR_ACCELERATION)
	
	mesh.rotation.y = rot
	interact.rotation.y = rot
	
	move_and_slide()	
