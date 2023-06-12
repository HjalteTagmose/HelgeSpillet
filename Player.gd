extends CharacterBody3D

const SPEED = 5.0
const ACCELERATION = 10
const JUMP_VELOCITY = 4.5
const ANGULAR_ACCELERATION = 10

var mesh : Node3D
var rot = 0.0
var target_rot = 0.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	mesh = get_node("Mesh")

func _physics_process(delta):
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
		velocity.x = lerp(velocity.x, direction.x * SPEED, delta * ACCELERATION)
		velocity.z = lerp(velocity.z, direction.z * SPEED, delta * ACCELERATION)
		target_rot = atan2(direction.x, direction.z)
	else:
		velocity.x = lerp(velocity.x, 0.0, delta * ACCELERATION)
		velocity.z = lerp(velocity.z, 0.0, delta * ACCELERATION)
	
	rot = lerp_angle(rot, target_rot, delta * ANGULAR_ACCELERATION)
	mesh.rotation.y = rot
	move_and_slide()

	print(rad_to_deg(target_rot))
	
