extends CanvasLayer


func _on_boton_comenzar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/cutscene_intro.tscn")


func _on_boton_salir_pressed() -> void:
	get_tree().quit()
