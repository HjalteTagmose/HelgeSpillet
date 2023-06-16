extends AudioStreamPlayer3D

var sfx_kniv_hak 	= preload("res://Audio/sfx/knivhak.wav")
var sfx_pak 		= preload("res://Audio/sfx/pack.wav")
var sfx_kødhakker	= preload("res://Audio/sfx/kødhakker.wav")
var sfx_slam 		= preload("res://Audio/sfx/slam-metal.wav")

func play_sfx(sfx):
	pitch_scale = 1 + randf_range(-0.1, 0.1)
	print("play", sfx)
	match sfx:
		SFX.KNIV_HAK:
			play_clip(sfx_kniv_hak)
		SFX.KØDHAKKER:
			play_clip(sfx_kødhakker)
		SFX.PAK:
			play_clip(sfx_pak)
		SFX.SLAM:
			play_clip(sfx_slam)

func play_clip(clip):
	stream = clip
	play()

enum SFX
{
	KNIV_HAK,
	KØDHAKKER,
	PAK,
	SLAM,
}
