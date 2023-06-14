class_name Interactable 
extends RigidBody3D

var prompt : Prompt = preload("res://prompt.tscn").instantiate()

func _init():
	print(prompt)
	add_child(prompt)

func interact(point):
	hide_prompt()

func show_prompt():	
	prompt.set_pos(global_position)
	prompt.show() 

func hide_prompt():
	prompt.hide()
