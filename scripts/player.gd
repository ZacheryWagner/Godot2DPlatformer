extends CharacterBody2D

const SPEED = 120.0
const JUMP_VELOCITY = -275.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Handle Sprites
	var direction := Input.get_axis("move_left", "move_right")
	handleAnimation(delta, direction)
	handleMovement(delta, direction)

	move_and_slide()

func handleAnimation(delta: float, direction: int ) -> void:
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			sprite.play("idle")
		else:
			sprite.play("run")
	else:
		sprite.play("jump")

func handleMovement(delta: float, direction: int ) -> void:
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
