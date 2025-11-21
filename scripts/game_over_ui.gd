extends CanvasLayer

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_reintentar_pressed() -> void:
	get_tree().reload_current_scene()


func _on_volver_a_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/hud_portada.tscn")
