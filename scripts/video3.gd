extends VideoStreamPlayer


func _ready():
	# el video ya se reproduce solo por Autoplay
	connect("finished", Callable(self, "_on_video_finished"))

func _on_video_finished():
	get_tree().change_scene_to_file("res://scenes/portada.tscn")
