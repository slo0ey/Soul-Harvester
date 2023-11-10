extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

const SPEED := 250

func _physics_process(delta):
	var direction := move_direction()
	
	velocity.x = apply_acceleration(velocity.x, direction.x, delta)
	velocity.y = apply_acceleration(velocity.y, direction.y, delta)
	
	if direction.x < 0:
		animated_sprite_2d.flip_h = true
	elif direction.x > 0:
		animated_sprite_2d.flip_h = false
	
	move_and_slide()

func move_direction() -> Vector2:
	var direction := Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)
	
	if direction:
		return direction.normalized()
	else:
		return direction

func apply_acceleration(base: float, dir: float, delta: float) -> float:
	return move_toward(base, dir * SPEED, delta * 1000)
