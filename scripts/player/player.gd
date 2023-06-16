class_name Player
extends CharacterBody3D

const ROTATION = 0#-45
const SPEED = 5.0
const ACCELERATION = 10
const JUMP_VELOCITY = 4.5
const ANGULAR_ACCELERATION = 10

var rot = 0.0
var target_rot = 180.0
var target_speed_x = 0.0
var target_speed_z = 0.0
var push_force = .5;

var mesh
var interact
var subtitle

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	mesh = get_node("Mesh")
	interact = get_node("Interaction")
	subtitle = get_node("Subtitle")
	spit_fire()

func _physics_process(delta):
	subtitle.set_pos(global_position + Vector3.UP*2)
	move(delta)
	process_collisions()

func process_collisions():
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		for k in range(collision.get_collision_count()):
			var body = collision.get_collider(k) as RigidBody3D
			if body == null:
				continue
			var point = collision.get_position(k) - body.global_position
			body.apply_impulse(-collision.get_normal(k) * push_force, point)

func move(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = -Input.get_vector("left", "right", "up", "down").rotated(deg_to_rad(ROTATION))
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

func spit_fire():
	subtitle.update("Ja, gu' det da rigtigt")
