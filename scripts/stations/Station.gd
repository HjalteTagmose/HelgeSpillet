class_name Station
extends StaticBody3D

@export var prompt_text = "interact"
@export var place_point : Node3D
@export var spawn_point : Node3D
@export var prompt_offset : Vector3

var prompt : Prompt = preload("res://Prefabs/prompt.tscn").instantiate()
var trigger : Area3D
var occupant

func _ready():
	trigger = get_node("Trigger")
	trigger.body_entered.connect(on_body_entered)
	prompt.text = "Z"
	add_child(prompt)
	setup_prompt()
	
func setup_prompt():
	await get_tree().create_timer(0.1).timeout
	prompt.set_use()
	prompt.set_button_text(prompt_text)

func _process(_delta):
	if !has_occupant():
		prompt.hide()
		return

	if occupant.is_held:
		occupant = null
		prompt.hide()
		return

	prompt.set_pos(global_position, prompt_offset)
	prompt.show()

func on_body_entered(body):
	if has_occupant():
		return

	if body.is_in_group("interactable") && !body.is_held && can_use_item(body):
		body.pickup(place_point)
		body.is_held = false
		body.freeze = false
		body.collision_layer = 1
		occupant = body
		SfxManager.play_sfx(SfxManager.SFX.SLAM)

func use():
	print("using station: ", self)
	prompt.hide()
	
func has_occupant():
#	print("occupant: ", occupant)
	return occupant != null

func can_use_item(item):
	return false
	
func can_use():
	return has_occupant() && can_use_item(occupant)
	
func spawn(prefab):
	print("spawn")
	var obj = prefab.instantiate()
	get_tree().get_root().add_child(obj)
	obj.global_position = spawn_point.global_position
	occupant.free()
	occupant = null
