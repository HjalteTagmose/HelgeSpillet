class_name Meat
extends Pickupable

@export var can_cut = false
@export var can_pack = false
@export var can_ground = false

enum MeatType
{ 
	SPEGEPØLSE, 
	MØRBRAD,
	FLÆSK,
	HAKKET_SVINEKØD,
	FLÆSKESTEG,
	PAKKET_MØRBRAD,
	PAKKET_SVINEKØD,
	PAKKET_FLÆSKESTEG,
}
