extends Node

var points = 0
var sales_mørbrad = 0
var sales_flæskesteg = 0
var sales_svinekød = 0
var sales_spegepølse = 0

func adjust_points(adj):
	points += adj
	print(adj, " POINTS! (", points, ")")

func add_points(meat):
	match meat:
		Meat.Type.PAKKET_MØRBRAD:
			adjust_points(200)
			sales_mørbrad+=1
			return
		Meat.Type.PAKKET_FLÆSKESTEG:
			adjust_points(300)
			sales_flæskesteg+=1
			return
		Meat.Type.PAKKET_SVINEKØD:
			adjust_points(300)
			sales_svinekød+=1
			return
		Meat.Type.SPEGEPØLSE:
			adjust_points(100)
			sales_spegepølse+=1
			return

	print("ADD POINTS FUCKED YOOOO")
