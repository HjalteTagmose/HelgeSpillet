extends Node

signal switch_language
var language = Language.Dansk

func _process(delta):
	if Input.is_action_just_pressed("switch-language"):
		change_language()

func change_language():
	if language == Language.Dansk:
		language = Language.English
	else:
		language = Language.Dansk
	
	switch_language.emit(language)

func translate(txt):
	match txt:
		"Skær": 		return "Cut"
		"Pak": 			return "Pack"
		"Hak": 			return "Hack"
		"Spegepøls": 	return "Salami"
		"Flæsk": 		return "Pork"
		"Mørbrad": 		return "Tenderloin"
		"Giv": 			return "Give"
		"Saml op": 		return "Pick up"

	print("Couldn't translate: ", txt)
	return txt

enum Language
{
	Dansk,
	English,
}
