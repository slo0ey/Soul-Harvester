class_name Monster1_Chase
extends State

const Utils = preload("res://Scripts/Utils.gd")

signal target_undetected
signal target_encounted

func _ready():
	set_physics_process(false)

func _enter_state():
	set_physics_process(true)
	actor.animator.play("Walk")

func _exit_state():
	set_physics_process(false)

func _physics_process(delta):
	var target = actor.target
	var direction = target.global_position - actor.global_position
	var distance = direction.length()
	var new_eye_direction = actor.eye_direction
	
	if distance >= 160:
		target_undetected.emit()
	elif distance < 50:
		target_encounted.emit()
	else:
		direction.y = 0
		direction = direction.normalized()
		
		actor.velocity.x = move_toward(actor.velocity.x, direction.x * actor.speed, delta * 1000)
		actor.velocity.y += actor.gravity
		
		if actor.velocity.x < 0:
			new_eye_direction = Vector2.LEFT
		elif actor.velocity.x > 0:
			new_eye_direction = Vector2.RIGHT
		
		if new_eye_direction != actor.eye_direction:
			Utils.apply_flip(actor, true)
			actor.eye_direction = new_eye_direction
		
		actor.move_and_slide()
