extends Node

@export var metal_table_mat : BaseMaterial3D
@export var kniv_highlight_mat : BaseMaterial3D
@export var flæsk_highlight_mat : BaseMaterial3D
@export var mørbrad_highlight_mat : BaseMaterial3D
@export var kødhakker_highlight_mat : BaseMaterial3D
@export var spegepøls_container_mat : BaseMaterial3D

var customer_manager
var cont = false

func _ready():
	# setup
	var customer
	customer_manager = get_node("Kunder")
	await get_tree().create_timer(1.1).timeout

	# spegepøls tutorial
	customer = customer_manager.spawn()
	
	var spegepøls_spawn = get_node("SpegepølsSpawner")
	spegepøls_spawn.spawned_meat.connect(continue_game)
	spegepøls_container_mat.rim_enabled = true
	await wait_until_continue();
	spegepøls_spawn.spawned_meat.disconnect(continue_game)
	spegepøls_container_mat.rim_enabled = false

	# spegepøls play
	for i in 5:
		customer = customer_manager.spawn()
		await randomized_time(2)

	# mørbrad tutorial
	cont = false
	customer = customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 65)
	customer.on_leave.connect(continue_game)
	
	var mørbrad_spawn = get_node("MørbradSpawner")
	mørbrad_highlight_mat.rim_enabled = true
	await wait_until_continue();
	mørbrad_highlight_mat.rim_enabled = false

	# mørbrad play
	customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 45)
	await randomized_time(1)
	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
	await randomized_time(3)
	customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 45)
	await randomized_time(4)
	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
	await randomized_time(3)
	customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 45)
	await randomized_time(1)
	customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 45)
	await randomized_time(4)
	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
	await randomized_time(2)
	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
	await randomized_time(10)

	# svinekød tutorial
	customer = customer_manager.spawn(Meat.Type.PAKKET_SVINEKØD, 75)
	customer.on_leave.connect(continue_game)

	kødhakker_highlight_mat.rim_enabled = true
	metal_table_mat.rim_enabled = true
	cont = false
	await wait_until_continue();
	kødhakker_highlight_mat.rim_enabled = false
	metal_table_mat.rim_enabled = false

	# svinekød play
	customer_manager.spawn(Meat.Type.PAKKET_SVINEKØD, 55)
	await randomized_time(1)
	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
	await randomized_time(3)
	customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 45)
	await randomized_time(3)
	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
	await randomized_time(3)
	customer_manager.spawn(Meat.Type.PAKKET_SVINEKØD, 55)
	await randomized_time(2)
	customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 45)
	await randomized_time(3)
	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
	customer_manager.spawn(Meat.Type.PAKKET_SVINEKØD, 55)
	await randomized_time(2)
	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
	await randomized_time(15)

	# flæskesteg tutorial
	customer = customer_manager.spawn(Meat.Type.PAKKET_FLÆSKESTEG, 75)
	customer.on_leave.connect(continue_game)
	
	flæsk_highlight_mat.rim = true
	kniv_highlight_mat.rim = true
	cont = false
	await wait_until_continue()
	flæsk_highlight_mat.rim = false
	kniv_highlight_mat.rim = false

	# flæskesteg play
	customer_manager.spawn(Meat.Type.PAKKET_FLÆSKESTEG, 65)
	await randomized_time(1)
	customer_manager.spawn(Meat.Type.PAKKET_FLÆSKESTEG, 65)
	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
	await randomized_time(3)
	customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 45)
	await randomized_time(3)
	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
	await randomized_time(3)
	customer_manager.spawn(Meat.Type.PAKKET_SVINEKØD, 55)
	await randomized_time(2)
	customer_manager.spawn(Meat.Type.PAKKET_MØRBRAD, 45)
	await randomized_time(3)
	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
	customer_manager.spawn(Meat.Type.PAKKET_FLÆSKESTEG, 65)
	await randomized_time(2)
	customer_manager.spawn(Meat.Type.SPEGEPØLSE, 35)
	await randomized_time(10)

	# Gameplay!
	for i in 20:
		await spawn_random()

	await randomized_time(17)

#	# INSPECTOR WARNING
#	print("INSPECTOR WARNING!")
#
#	for i in 20:
#		await spawn_random()
#
#	await randomized_time(14)
#
#	# INSPECTOR SPAWN
#	print("INSPECTOR SPAWN!")
#
#	await randomized_time(10)
#
#	for i in 20:
#		await spawn_random()

	await customer_manager.no_customers
	
	# finish game
	print("FINISH!")
	get_node("UI/Rapport").finish()

func _process(delta):
	if Input.is_action_just_pressed("restart"):
		get_tree(). reload_current_scene()
		metal_table_mat.rim_enabled = false
		kniv_highlight_mat.rim_enabled = false
		flæsk_highlight_mat.rim_enabled = false
		mørbrad_highlight_mat.rim_enabled = false
		kødhakker_highlight_mat.rim_enabled = false
		spegepøls_container_mat.rim_enabled = false

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
