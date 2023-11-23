class_name PoisonBall
extends Entity

@export_range(0, 2) var mode: int

const directions = [Vector2(-50, -300), Vector2(0, -350), Vector2(50, -300)]

func _ready():
	var dir: Vector2 = directions[mode]
	velocity.x = dir.x
	velocity.y = dir.y

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		$CollisionShape2D.disabled = true
		velocity.x = 0
		velocity.y = 0
		global_position.y += 5
		
		animator.play("Burn")
		animator.animation_finished.connect(on_animation_finish)
		set_physics_process(false)

	sprite.rotation = velocity.angle()
	move_and_slide()
	
func on_animation_finish(_name):
	queue_free()
