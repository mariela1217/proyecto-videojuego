extends Area2D

@onready var game_manager: Node = %GameManager
@onready var sonido_manzana: AudioStreamPlayer2D = $SonidoManzana
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _on_body_entered(body: Node2D) -> void:
	game_manager.incrementa_un_punto()
	sonido_manzana.play()
	animated_sprite.visible = false
	collision_shape.call_deferred("set", "disabled", true)


func _on_sonido_manzana_finished() -> void:
	queue_free()
