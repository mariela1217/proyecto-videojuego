extends Node2D
const SPEED = 150
var direction = 1

@onready var ray_cast_derecha: RayCast2D = $RayCast2DR
@onready var ray_cast_izquierda: RayCast2D = $RayCast2DL

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_derecha.is_colliding():
		direction = -1
	if ray_cast_izquierda.is_colliding():
		direction = 1

	
	position.x += direction * SPEED * delta
	
