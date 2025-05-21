extends Node2D

const SPEED: float = 60

var direction: int = 1

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Detect direction
	if ray_cast_right.is_colliding():
		direction = -1
		sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		sprite.flip_h = false
		
	# Process Movement
	position.x += direction * SPEED * delta
