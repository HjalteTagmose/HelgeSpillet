class_name Interactable 
extends RigidBody3D

var prompt : Prompt = preload("res://Prefabs/prompt.tscn").instantiate()

func _ready():
	print(prompt)
	add_child(prompt)
	await get_tree().create_timer(0.1).timeout
	prompt.set_interact()

func interact(point):
	hide_prompt()

func show_prompt():	
	prompt.set_pos(global_position)
	prompt.show() 

func hide_prompt():
	prompt.hide()
