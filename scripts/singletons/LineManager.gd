extends AudioStreamPlayer3D

var flæsk_på_hylderne   = preload("res://Audio/flæsk-på-hylderne.wav")
var hvordan_med_mørbrad = preload("res://Audio/hvordan-går-med-mørbra.wav")
var færdig_slut 		= preload("res://Audio/250-færdig-slut.wav")
var forblødte			= preload("res://Audio/forblødte.wav")
var har_ik_tid_pjat		= preload("res://Audio/har-ik-tid-til-pjat.wav")
var jajaja				= preload("res://Audio/JAJAJA.wav")
var ku_it_bli_anerledes = preload("res://Audio/ku-it-bli-anerledes.wav")
var ledigang_rod_ondt	= preload("res://Audio/lediggang-roden-til-alt-ond.wav")

var player : Subtitle

func _ready():
	player = get_node("/root/root/Player/Subtitle")

func speak(subtitle: Subtitle, line: Line):
	match line:
		Line.FLÆSK_PÅ_HYLDERNE:
			play_clip(flæsk_på_hylderne)
			subtitle.update("Der er flæsk på hylderne", "There is flesh on the shelves", 0.09)
			await finish_then_reset(subtitle)
		Line.HVORDAN_MED_MØRBRAD:
			play_clip(hvordan_med_mørbrad)
			subtitle.update("Hvordan går det mæ min mørbra'", "How goes it with my tenderloin", 0.035)
			await finish_then_reset(subtitle, .2)
			if randf() < 0.3:
				speak(player, Line.JAJAJA)
		Line.FÆRDIG_SLUT:
			play_clip(færdig_slut)
			subtitle.update("250! Færdig. Slut.", "250! Done. End.", 0.09)
			await finish_then_reset(subtitle)
		Line.FORBLØDTE:
#			subtitle.update("Så no'et som et lam, de blev lige lagt op på en skraver, så fik de kniven, så forblødte de og så var det overstået", "Then something like a lamb, they were just put on a scraper, then they got the knife, then they bled out and then it was over", 0.025)
			play_clip(forblødte)
			subtitle.update("Så no'et som et lam", "Then something like a lamb", 0.035)
			await subtitle.finished
			subtitle.update("de blev lige lagt op på en skraver", "they were just put on a scraper", 0.035)
			await subtitle.finished
			subtitle.update("så fik de kniven, så forblødte de og så var det overstået", "then they got the knife, then they bled out and then it was over", 0.025)
			await finish_then_reset(subtitle)
		Line.JAJAJA:
			subtitle.update("JA JA JA", "YES YES YES", .08)
			play_clip(jajaja)
			await finish_then_reset(subtitle)
		Line.LEDIGANG_ROD_ONDT:
			play_clip(ledigang_rod_ondt)
			subtitle.update("Det er jo ik løgn det de fortæller, ledi'gang det er ro'en til alt ondt", "It's not a lie what they tell, idleness is the root of all evil", 0.032)
			await finish_then_reset(subtitle)
		Line.KU_IT_BLI_ANERLEDES:
			play_clip(ku_it_bli_anerledes)
			subtitle.update("Ku ik bli' anderles'", "Could not be otherwise", 0.032)
			await finish_then_reset(subtitle)

func finish_then_reset(subtitle, time = 1):
	await finished
	await time(time)
	subtitle.update("","")

func play_clip(clip):
	stream = clip
	play()

func time(t):
	await get_tree().create_timer(t).timeout

enum Line
{
	FLÆSK_PÅ_HYLDERNE,
	HVORDAN_MED_MØRBRAD,
	FÆRDIG_SLUT,
	FORBLØDTE,
	JAJAJA,
	LEDIGANG_ROD_ONDT,
	KU_IT_BLI_ANERLEDES,
}
