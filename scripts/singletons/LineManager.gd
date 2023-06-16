extends AudioStreamPlayer3D

var flæsk_på_hylderne   = preload("res://Audio/flæsk-på-hylderne.wav")
var hvordan_med_mørbrad = preload("res://Audio/hvordan-går-med-mørbra.wav")

var player : Subtitle

func _ready():
	player = get_node("/root/root/Player/Subtitle")

func speak(subtitle: Subtitle, line: Line):
	match line:
		Line.FLÆSK_PÅ_HYLDERNE:
			subtitle.update("Der er flæsk på hylderne", "There is flesh on the shelves", 0.09)
			play_clip(flæsk_på_hylderne)
			await finished
			await time(1)
			subtitle.update("","")
			
		Line.HVORDAN_MED_MØRBRAD:
			subtitle.update("Hvordan går det mæ min mørbra'", "How goes it with my tenderloin", 0.035)
			play_clip(hvordan_med_mørbrad)

func play_clip(clip):
	stream = clip
	play()

func time(t):
	await get_tree().create_timer(t).timeout

enum Line
{
	FLÆSK_PÅ_HYLDERNE,
	HVORDAN_MED_MØRBRAD,
}
