extends CanvasLayer

@export var escena_a_cargar: PackedScene
@export var audio: AudioStream

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_boton_comenzar_pressed() -> void:
	if escena_a_cargar:
		AudioPlayer.play(audio)
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		get_tree().change_scene_to_packed(escena_a_cargar)


func _on_boton_salir_pressed() -> void:
	get_tree().quit()
