class_name Meat 
extends Pickupable

@export var can_cut = false
@export var can_pack = false
@export var can_grind = false
@export var type : Type 

enum Type
{
	SPEGEPØLSE,
	MØRBRAD,
	FLÆSK,
	HAKKET_SVINEKØD,
	FLÆSKESTEG,
	PAKKET_MØRBRAD,
	PAKKET_FLÆSKESTEG,
	PAKKET_SVINEKØD,
}
