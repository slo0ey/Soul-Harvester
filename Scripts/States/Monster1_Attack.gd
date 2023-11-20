class_name Monster1_Attack
extends State

const Utils = preload("res://Scripts/Utils.gd")

signal attack_end_target_undetected
signal attack_end_target_detected

func _ready():
	set_physics_process(false)

func _enter_state():
	set_physics_process(true)
	actor.animator.play("Attack")

func _exit_state():
	set_physics_process(false)

func _physics_process(delta):
	var target = actor.target
	var direction = target.global_position - actor.global_position
	var distance = direction.length()
	var new_eye_direction = actor.eye_direction
	
	if distance >= 160:
		attack_end_target_undetected.emit()
	elif distance >= 50:
		attack_end_target_detected.emit()
	else:
		if direction.x < 0:
			new_eye_direction = Vector2.LEFT
		elif direction.x > 0:
			new_eye_direction = Vector2.RIGHT
		
		if new_eye_direction != actor.eye_direction:
			Utils.apply_flip(actor, true)
			actor.eye_direction = new_eye_direction
		
		if actor.flame_attack_hitbox.overlaps_body(target):
			print("It hurts...")
