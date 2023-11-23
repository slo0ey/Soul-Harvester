class_name PoisonBall
extends Entity

@export_range(0, 2) var mode: int

const directions = [Vector2(-50, -300), Vector2(0, -450), Vector2(50, -300)]

func _ready():
	var dir: Vector2 = directions[mode]
	velocity.x = dir.x
	velocity.y = dir.y

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.x = 0
		velocity.y = 0
		
		animator.play("Burn")
		animator.animation_finished.connect(queue_free)
		set_physics_process(false)

	move_and_slide()
	
