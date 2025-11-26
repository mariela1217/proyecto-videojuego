extends Area2D

@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.wait_time = 1.0
	timer.one_shot = true

func _on_body_entered(body: Node2D) -> void:
	if not body:
		return

	# ----------- VACÍO --------------
	if is_in_group("vacio"):
		print("Muerte por caída")
		if body.has_method("die_falling"):
			body.die_falling()
		return

	# ----------- ENEMIGO ------------
	if is_in_group("enemigo"):
		print("Muerte por enemigo")
		if body.has_method("take_hit"):
			body.take_hit()
		return

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
