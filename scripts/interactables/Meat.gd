class_name Meat
extends Pickupable

@export var canCut = false
@export var canHak = false
@export var canPak = false

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
