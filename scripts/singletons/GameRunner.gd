extends Node

var customer_manager
var cont = false

func _ready():
	# setup
	var customer
	customer_manager = get_node("Kunder")
	await get_tree().create_timer(0.1).timeout
#
#	# spegepøls tutorial
#	customer = customer_manager.spawn()
#	customer.on_leave.connect(continue_game)
#	await wait_until_continue();
#
#	# spegepøls play
#	for i in 5:
#		customer = customer_manager.spawn()
#		await randomized_time(2)
#
#	# mørbrad tutorial
#	customer = customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 65)
#	customer.on_leave.connect(continue_game)
##	var mørbrad_spawn = get_node("MørbradSpawner")
##	mørbrad_spawn.tutorial.visible = true
##	mørbrad_spawn.spawned_meat.connect(func: mørbrad_spawn.tutorial.visible = false)
#
#	await wait_until_continue()
#
#	# mørbrad play
#	customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 45)
#	await randomized_time(1)
#	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
#	await randomized_time(3)
#	customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 45)
#	await randomized_time(4)
#	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
#	await randomized_time(3)
#	customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 45)
#	await randomized_time(1)
#	customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 45)
#	await randomized_time(4)
#	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
#	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
#	await randomized_time(2)
#	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
#	await randomized_time(10)
#
#	# svinekød tutorial
#	customer = customer_manager.spawn(Meat.Type.PAKKET_SVINEKØD, 75)
#	customer.on_leave.connect(continue_game)
#	await wait_until_continue()
#
#	# svinekød play
#	customer_manager.spawn(Meat.Type.PAKKET_SVINEKØD, 55)
#	await randomized_time(1)
#	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
#	await randomized_time(3)
#	customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 45)
#	await randomized_time(3)
#	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
#	await randomized_time(3)
#	customer_manager.spawn(Meat.Type.PAKKET_SVINEKØD, 55)
#	await randomized_time(2)
#	customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 45)
#	await randomized_time(3)
#	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
#	customer_manager.spawn(Meat.Type.PAKKET_SVINEKØD, 55)
#	await randomized_time(2)
#	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
#	await randomized_time(15)
#
#	# flæskesteg tutorial
#	customer = customer_manager.spawn(Meat.Type.PAKKET_FLÆSKESTEG, 75)
#	customer.on_leave.connect(continue_game)
#	await wait_until_continue()
#
#	# flæskesteg play
#	customer_manager.spawn(Meat.Type.PAKKET_FLÆSKESTEG, 65)
#	await randomized_time(1)
#	customer_manager.spawn(Meat.Type.PAKKET_FLÆSKESTEG, 65)
#	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
#	await randomized_time(3)
#	customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 45)
#	await randomized_time(3)
#	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
#	await randomized_time(3)
#	customer_manager.spawn(Meat.Type.PAKKET_SVINEKØD, 55)
#	await randomized_time(2)
#	customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 45)
#	await randomized_time(3)
#	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
#	customer_manager.spawn(Meat.Type.PAKKET_FLÆSKESTEG, 65)
#	await randomized_time(2)
#	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
#	await randomized_time(10)

	# Gameplay!
	for i in 20:
		await spawn_random()

	# INSPECTOR WARNING
	print("INSPECTOR WARNING!")

	for i in 20:
		await spawn_random()

	# INSPECTOR SPAWN
	print("INSPECTOR SPAWN!")

	for i in 20:
		await spawn_random()

	# finish game
	print("FINISH!")

func spawn_random():
	var rnd = randf() * 4
	if rnd < 1:
		customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
		await randomized_time(2.5)
	elif rnd < 2:
		customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 45)
		await randomized_time(5)
	elif rnd < 3:
		customer_manager.spawn(Meat.Type.PAKKET_SVINEKØD, 50)
		await randomized_time(7)
	elif rnd < 4:
		customer_manager.spawn(Meat.Type.PAKKET_FLÆSKESTEG, 60)
		await randomized_time(8)

func wait_until_continue():
	while !cont:
		await get_tree().create_timer(0.01).timeout
	cont = false

func randomized_time(t):
	t = t + t * randf_range(-.1, .1)
	await get_tree().create_timer(t).timeout

func continue_game(n):
	cont = true
