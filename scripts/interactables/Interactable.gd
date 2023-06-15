class_name Interactable 
extends RigidBody3D

@export var offset = Vector3(.5,.5,0)
@export var prompt_text = "Saml op"
var prompt : Prompt = preload("res://Prefabs/prompt.tscn").instantiate()

func _ready():
	print(prompt)
	add_child(prompt)
	setup_prompt()

func interact(point):
	hide_prompt()

func show_prompt():	
	prompt.set_pos(global_position, offset)
	prompt.show() 

func hide_prompt():
	prompt.hide()
	
func setup_prompt():
	await get_tree().create_timer(0.1).timeout
	prompt.set_interact()
	prompt.set_button_text(prompt_text)
