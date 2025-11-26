extends Node2D

const SPEED = 150
var direction = 1

@onready var ray_cast_derecha: RayCast2D = $RayCast2DR
@onready var ray_cast_izquierda: RayCast2D = $RayCast2DL
@onready var zona_muerte: Area2D = $ZonaDeMuerte   # 🔥 ahora sí se obtiene

func _ready() -> void:
	# Conectar la señal del Area2D
	zona_muerte.body_entered.connect(_on_zona_muerte_body_entered)

func _process(delta: float) -> void:
	if ray_cast_derecha.is_colliding():
		direction = -1
	if ray_cast_izquierda.is_colliding():
		direction = 1
	
	position.x += direction * SPEED * delta

# 🔥 Aquí se golpea al jugador
func _on_zona_muerte_body_entered(body):
	if body.is_in_group("player"):
		body.take_hit()
