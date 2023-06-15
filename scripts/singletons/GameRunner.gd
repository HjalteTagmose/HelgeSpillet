extends Node

var customer_manager
var cont = false

func _ready():
	# setup
	customer_manager = get_node("Kunder")
	await get_tree().create_timer(0.1).timeout
	
	# spegepøls tutorial
	var customer = customer_manager.spawn()
	customer.on_leave.connect(continue_game)
	await wait_until_continue();
	
	# spegepøls play
	for i in 5:
		customer = customer_manager.spawn()
		await randomized_time(2)
	
	# mørbrad tutorial
	customer = customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 55)
	customer.on_leave.connect(continue_game)

#	var mørbrad_spawn = get_node("MørbradSpawner")
#	mørbrad_spawn.tutorial.visible = true
#	mørbrad_spawn.spawned_meat.connect(func: mørbrad_spawn.tutorial.visible = false)

	await wait_until_continue()
	
	
	
	# finish game
	print("FINISH!")
	
func wait_until_continue():
	while !cont:
		await get_tree().create_timer(0.01).timeout
	cont = false

func randomized_time(t):
	t = t + t * randf_range(-.1, .1)
	await get_tree().create_timer(t).timeout
	
func continue_game(n):
	cont = true
