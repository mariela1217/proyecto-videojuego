extends Node

func _ready() -> void:
	var meta = get_tree().get_current_scene().get_node_or_null("Meta")
	if meta:
		meta.meta_activada.connect(_on_meta_activada)
	else:
		print("Error: no se ha encontrado en la escena el nodo meta, que debe ser hijo de raiz de la misma")
	
func _on_meta_activada(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.velocity = Vector2.ZERO
		body.set_physics_process(false)
		body.set_process(false)
