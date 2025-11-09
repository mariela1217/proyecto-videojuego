extends Node2D



const NEXT_SCENE := "res://scenes/escena_01.tscn"  # cámbiala si tu ruta es distinta

func _ready():
	$Camera2D.make_current()                # Activa esta cámara (4.3)
	$Anim.play("intro")
	$Anim.animation_finished.connect(_on_anim_finished)

func _on_anim_finished(anim_name: StringName) -> void:
	if anim_name == "intro":
		get_tree().change_scene_to_file(NEXT_SCENE)

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):  # Enter / Espacio / A
		get_tree().change_scene_to_file(NEXT_SCENE)
