extends AudioStreamPlayer3D

var flæsk_på_hylderne   = preload("res://Audio/flæsk-på-hylderne.wav")
var hvordan_med_mørbrad = preload("res://Audio/hvordan-går-med-mørbra.wav")
var færdig_slut 		= preload("res://Audio/250-færdig-slut.wav")
var forblødte			= preload("res://Audio/forblødte.wav")
var har_ik_tid_pjat		= preload("res://Audio/har-ik-tid-til-pjat.wav")
var jajaja				= preload("res://Audio/JAJAJA.wav")
var ku_it_bli_anerledes = preload("res://Audio/ku-it-bli-anerledes.wav")
var ledigang_rod_ondt	= preload("res://Audio/lediggang-roden-til-alt-ond.wav")
var ka_slet_ik_køv_den	= preload("res://Audio/ve-du-va-du-ka-slet-ik-køv-den.wav")
var ikke_fint_nok		= preload("res://Audio/ikke-fint-nok.wav")
var danmark_for_blærerøv= preload("res://Audio/danmark-for-blærerøve.wav")
var bft					= preload("res://Audio/bft.wav")
var flæsk_forbudt		= preload("res://Audio/fedt-flæsk-forbudt.wav")
var for_helvete			= preload("res://Audio/for-helvete.wav")
var hæ_hæ				= preload("res://Audio/ha-hæ.wav")
var ikke_fornuft		= preload("res://Audio/ikke-noet-med-fornuft-at-gøre.wav")
var mikroma				= preload("res://Audio/mikroma-sovs-kartofler-bøf.wav")
var vi_danskere			= preload("res://Audio/vi-danskere.wav")

var player : Subtitle

func _ready():
	player = get_node("/root/root/Player/Subtitle")

func speak(subtitle: Subtitle, line: Line):
	if playing:
		return
	
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
		Line.IKKE_FINT_NOK:
			play_clip(ikke_fint_nok)
			subtitle.update("Det er ikke fint nok ti' en vis del af publikum", "It's not good enough for a certain part of the audience", 0.055)
			await finish_then_reset(subtitle)
		Line.KA_SLET_IK_KØV_DEN:
			play_clip(ka_slet_ik_køv_den)
			subtitle.update("Ve' du hva' du ka' slet ik køv den", "Know you what, you can not buy it", 0.032)
			await subtitle.finished
			await time(.5)
			subtitle.update("det meget enkelt", "its very simple", 0.032)
			await finish_then_reset(subtitle)
		Line.DANMARK_FOR_BLÆRERØVE:
			play_clip(danmark_for_blærerøv)
			subtitle.update("Er du ik' klar over at Danmark, det for blærerøve", "Are you not aware that Denmark is for show offs", 0.033)
			await finish_then_reset(subtitle)
		Line.BFT:
			play_clip(bft)
			subtitle.update("Bft", "Bft", 0.05)
			await finish_then_reset(subtitle)
		Line.FLÆSK_FORBUDT:
			play_clip(flæsk_forbudt)
			subtitle.update("Du må jo ik no'et. Du må ingen gang spise fedt flæsk. Det forbudt", "bft", 0.05)
			await finish_then_reset(subtitle)
		Line.FOR_HELVETE:
			play_clip(for_helvete)
			subtitle.update("For helvete", "Damn it")
			await finish_then_reset(subtitle)
		Line.HÆ_HÆ:
			play_clip(hæ_hæ)
			subtitle.update("Ha hæ ha hæ hæ", "Ha hæ ha hæ hæ", 0.09)
			await finish_then_reset(subtitle)
		Line.IKKE_FORNUFT:
			play_clip(ikke_fornuft)
			subtitle.update("Det har jo no'et at gøre, som jeg siger, mæ det kommer an på hvordan humøret er og hvordan ve'kommende's humør er", "It has jo something to do, how I  say, it depends on how the humor is and how their humor is", 0.04)
			await subtitle.finished
			await time(.3)
			subtitle.update("Det har ik noget mæ fornuft at gøre, nej ha", "It has nothing to do with sense, no ha", 0.04)
			await finish_then_reset(subtitle)
		Line.MIKROMA:
			play_clip(mikroma)
			subtitle.update("Tænk sig de ska' ha' mikroma'", "Just think, they eat micro-food",0.05)
			await subtitle.finished
			await time(.3)
			subtitle.update("Og jeg vil ha' sovs og kartofler og bøf", "And I want sauce and potatos and beef", 0.06)
			await subtitle.finished
			await time(.85)
			subtitle.update("Jeg vil sgu' ik ha' mikroma' eller pizza eller burger. Aldrig.", "I will sku not have microfood or pizza or burger. Never.", 0.07)
			await subtitle.finished
			await time(1)
			subtitle.update("Hahahaahah... nej, det var sgu' forfærdeli'", "Hahahaahah... no, that was horrible", 0.05)
			await finish_then_reset(subtitle)
		Line.VI_DANSKERE: 
			play_clip(vi_danskere)
			subtitle.update("Og så undskylder de mæ at det kommer fra EU bestemmelser", "And then ",0.04)
			await subtitle.finished
			await time(.1)
			subtitle.update("Jamen, så ku' de si' ve' i hva'", "Well, then they could say, you know what",0.04)
			await subtitle.finished
			await time(.2)
			subtitle.update("Det bestemmer vi selv, vi danskere", "That we decide ourselves, we're Danish",0.04)
			await finish_then_reset(subtitle)

func finish_then_reset(subtitle, time = 1.0):
	await finished
	await time(time)
	if subtitle != null:
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
	KA_SLET_IK_KØV_DEN,
	IKKE_FINT_NOK,
	DANMARK_FOR_BLÆRERØVE,
	BFT,
	FLÆSK_FORBUDT,
	FOR_HELVETE,
	HÆ_HÆ,
	IKKE_FORNUFT,
	MIKROMA,
	VI_DANSKERE,
}
