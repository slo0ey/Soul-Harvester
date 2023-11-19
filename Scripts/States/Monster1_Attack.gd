class_name Monster1_Attack
extends State

const Utils = preload("res://Scripts/Utils.gd")

signal attack_end_target_undetected
signal attack_end_target_detected

func _ready():
	set_physics_process(false)

func _enter_state():
	set_physics_process(true)
	actor.animator.animation_finished.connect(on_attack_end)
	actor.animator.play("Attack")

func _exit_state():
	set_physics_process(false)
	actor.animator.animation_finished.disconnect(on_attack_end)

func _physics_process(delta):
	var target = actor.target
	var direction = target.global_position - actor.global_position
	var distance = direction.length_squared()
	
	if actor.flame_attack_hitbox.overlaps_body(target):
		print("It hurts...")
	
	if direction.x < 0:
		Utils.apply_flip(actor.sprite, true)
	else:
		Utils.apply_flip(actor.sprite, false)

func on_attack_end():
	var target = actor.target
	var direction = target.global_position - actor.global_position
	var distance = direction.length_squared()
	
	if distance >= 160:
		attack_end_target_undetected.emit()
	elif distance >= 50:
		attack_end_target_detected.emit()
	else:
		actor.animator.play("Attack")
