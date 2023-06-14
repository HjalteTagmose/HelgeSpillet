class_name Customer
extends PathFollow3D

@export var wants : Meat.Type
var prompt : Prompt = preload("res://prompt.tscn").instantiate()

var goal = 0
var speed = 5

func _ready():
	speed += randf_range(-0.1 * speed, 0.1 * speed)
	prompt.hide()

func _process(delta):
	move(delta)

func move(delta):
	if goal > progress:
		progress += delta * speed

