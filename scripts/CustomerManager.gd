class_name CustomerManager
extends Path3D

@export var prefab : PackedScene
@export var spacing = 2.0

var customers = [] 
var length
var total = 0

signal no_customers

func _ready():
	length = get_curve().get_baked_length()-.1

func spawn(meat_type = Meat.Type.SPEGEPØLSE, time = 30):
	var customer = prefab.instantiate()
	customers.append(customer)
	add_child(customer)
	
	customer.setup(meat_type, time)
	customer.goal = length - customers.size() * spacing
	customer.num = total
	customer.on_leave.connect(update_queue)
	
	total += 1
	return customer

func update_queue(n):
	print("update_queue")
	var rm = -1
	for customer in customers:
		if customer.num == n:
			rm = customers.find(customer, 0)
			continue
		if customer.num > n:
			customer.goal += spacing

	if rm >= 0:
		customers.remove_at(rm)
		
	if customers.size() == 0:
		no_customers.emit()
