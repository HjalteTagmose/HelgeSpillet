class_name Customer
extends PathFollow3D

var goal = 0
var speed = 5

func _ready():
	speed += randf_range(-0.1 * speed, 0.1 * speed)

func _process(delta):
	move(delta)

func move(delta):
	if goal > progress:
		progress += delta * speed

