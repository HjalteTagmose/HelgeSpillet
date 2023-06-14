class_name CustomerManager
extends Path3D

@export var prefab : PackedScene
@export var spacing = 2.0

var customers = [] 
var length

func _ready():
	length = get_curve().get_baked_length()-.1
	spawn(prefab)
	spawn(prefab)
	spawn(prefab)
	spawn(prefab)

func spawn(customer_prefab):
	var customer = customer_prefab.instantiate()
	customer.goal = length - customers.size() * spacing
	customers.append(customer)
	add_child(customer)
	
