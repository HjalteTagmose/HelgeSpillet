extends Node

var points = 0

func adjust_points(adj):
	points += adj
	print(adj, " POINTS! (", points, ")")
