extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

const H_SPEED := 150

func _physics_process(delta):
	var h_dir := Input.get_axis("move_left", "move_right")
	
	if h_dir == 0:
		apply_friction()
	else:
		if h_dir < 0:
			animated_sprite_2d.flip_h = true
		else:
			animated_sprite_2d.flip_h = false
			
		apply_acceleration(h_dir)
	
	move_and_slide()

func apply_friction():
	velocity.x = move_toward(velocity.x, 0, 10)

func apply_acceleration(amount):
	velocity.x = move_toward(velocity.x, H_SPEED * amount, 10)
