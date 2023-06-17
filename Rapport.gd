extends TextureRect

var smiley_glad = preload("res://Assets/UI/kontrolrapport/smiley_glad.png")
var smiley_ligeglad = preload("res://Assets/UI/kontrolrapport/smiley_ligeglad.png")
var smiley_trist = preload("res://Assets/UI/kontrolrapport/smiley_trist.png")

var smiley_main
var smiley_1
var smiley_2
var smiley_3
var label_main
var label_1 : Label
var label_2
var label_3

func _ready():
	smiley_main = get_node("SmileyMain")
	smiley_1 = get_node("Smiley1")
	smiley_2 = get_node("Smiley2")
	smiley_3 = get_node("Smiley3")
	
	label_main = get_node("SmileyMain/Label")
	label_1 = get_node("Smiley1/Label")
	label_2 = get_node("Smiley2/Label")
	label_3 = get_node("Smiley3/Label")
	
	finish()
	await get_tree().create_timer(0.01).timeout
	self.visible = false

func finish():
	self.visible = true
	print("rapport!")
	label_main.text = str(PointSystem.points) + " kroner"
	label_1.text = str(PointSystem.sales_mørbrad) + "x mørbrad"
	label_2.text = str(PointSystem.sales_svinekød) + "x svinekød"
	label_3.text = str(PointSystem.sales_flæskesteg) + "x flæskesteg"
