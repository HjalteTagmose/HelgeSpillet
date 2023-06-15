extends Node

var points = 0

func _ready():
	adjust_points(10)

func adjust_points(adj):
	points += adj
	print(adj, " POINTS! (", points, ")")
