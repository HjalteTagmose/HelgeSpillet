class_name CustomerManager
extends Path3D

@export var prefab : PackedScene
@export var spacing = 2.0

var customers = [] 
var length
var total = 0

func _ready():
	length = get_curve().get_baked_length()-.1
	spawn(prefab)
	spawn(prefab)
	spawn(prefab)
	spawn(prefab)

func spawn(customer_prefab):
	var customer = customer_prefab.instantiate()
	customers.append(customer)
	add_child(customer)
	
	customer.goal = length - customers.size() * spacing
	customer.num = total
	customer.on_leave.connect(update_queue)
	
	total += 1

func update_queue(n):
	print("update_queue")
	for customer in customers:
		if customer == null:
			continue
		if customer.num > n:
			customer.goal += spacing
