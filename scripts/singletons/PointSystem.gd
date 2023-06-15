extends Node

var points = 0

func adjust_points(adj):
	points += adj
	print(adj, " POINTS! (", points, ")")

func get_points(meat):
	match meat:
		Meat.Type.PAKKET_MØRBRAD:
			return 200
		Meat.Type.PAKKET_FLÆSKESTEG:
			return 300
		Meat.Type.PAKKET_SVINEKØD:
			return 300
		Meat.Type.SPEGEPØLSE:
			return 100
	
	print("GET POINTS FUCKED YOOOO")
	return 0
