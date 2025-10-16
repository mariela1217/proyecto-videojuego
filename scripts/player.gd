extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0

#func _ready():
	#print("=== ANIMACIONES CONFIGURADAS ===")
	#var animaciones = $AnimatedSprite2D.sprite_frames.get_animation_names()
	#for anim in animaciones:
	#	print("- ", anim)
	#print("================================")


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	control_animaciones(direction)
	move_and_slide()

func control_animaciones(direction: float) -> void:
	if is_on_floor():
		if direction != 0:
			$AnimatedSprite2D.animation = "run"
			$AnimatedSprite2D.flip_h = direction < 0
		else:
			$AnimatedSprite2D.animation = "idle"
	else:
		$AnimatedSprite2D.animation = "jump"
		
	if $AnimatedSprite2D.sprite_frames.has_animation($AnimatedSprite2D.animation):
			$AnimatedSprite2D.play()
