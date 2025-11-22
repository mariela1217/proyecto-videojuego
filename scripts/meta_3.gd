extends Sprite2D

@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
@export var musica_final_nivel: AudioStream

signal meta_activada(body: Node2D)

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("meta 3 alcanzada")
	if musica_final_nivel:
		Musica.cambiar_musica(musica_final_nivel)
	
	collision_shape_2d.set_deferred("disabled", true)
	meta_activada.emit(body)
	
	if musica_final_nivel:
		await Musica.finished
		
	get_tree().change_scene_to_file("res://scenes/escena_03.tscn")
