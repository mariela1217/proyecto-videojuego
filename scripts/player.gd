extends CharacterBody2D

@onready var sonido_salto: AudioStreamPlayer2D = $SonidoSalto
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var colision: CollisionShape2D = $CollisionShape2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0

#signal player_died
signal player_died(death_type)
var controls_enabled = true
var is_dead = false
var death_jump_velocity = -420        # Salto hacia arriba al morir (como Mario)
var gravity_force = 1000              # Gravedad aumentada para caer rápido después

func _ready():
	print("=== ANIMACIONES CONFIGURADAS ===")
	for anim in sprite.sprite_frames.get_animation_names():
		print(" - ", anim)
	print("================================")


func _physics_process(delta: float) -> void:
	if is_dead:
		return

	# Gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Salto
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and controls_enabled:
		velocity.y = JUMP_VELOCITY
		sonido_salto.play()

	# Movimiento horizontal
	var direction := 0.0
	
	if controls_enabled:
		direction = Input.get_axis("ui_left", "ui_right")
		if direction != 0:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * 2)

	# Animaciones
	control_animaciones(direction)

	move_and_slide()


func control_animaciones(direction: float) -> void:
	if is_dead:
		return

	if is_on_floor():
		if direction != 0:
			sprite.animation = "run"
			sprite.flip_h = direction < 0
		else:
			sprite.animation = "idle"
	else:
		sprite.animation = "jump"

	if sprite.sprite_frames.has_animation(sprite.animation):
		sprite.play()

func take_hit():
	if is_dead:
		return
	is_dead = true
	controls_enabled = false
	sprite.play("hit")
	colision.disabled = true
	
	await sprite.animation_finished
	
	die()

func die():
	velocity = Vector2.ZERO
	set_physics_process(false)
	
	emit_signal("player_died", "hit")
	
	#get_tree().reload_current_scene()

func die_falling():
	if is_dead:
		return

	is_dead = true
	controls_enabled = false

	# Desactivar física normal
	set_physics_process(false)
	colision.disabled = true

	# Reproducir animación de muerte DESDE EL PRIMER FRAME
	if sprite.sprite_frames.has_animation("death"):
		sprite.play("death")
	else:
		# fallback si no existe death
		sprite.animation = "jump"
		sprite.play()

	# Rotación tipo Mario
	rotation_degrees = 180

	# Impulso hacia arriba al mismo tiempo que inicia animación
	var vel = Vector2(0, death_jump_velocity)

	# --- CAÍDA INICIA INMEDIATAMENTE ---
	while global_position.y < 2000:
		vel.y += gravity_force * get_process_delta_time()
		global_position.y += vel.y * get_process_delta_time()

		# animación sigue reproduciéndose normal
		await get_tree().process_frame
		
	emit_signal("player_died", "fall")

	#get_tree().reload_current_scene()
