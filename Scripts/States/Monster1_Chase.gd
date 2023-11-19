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
	var distance = direction.length_squared()
	
	if direction.x < 0:
		Utils.apply_flip(actor.sprite, true)
	else:
		Utils.apply_flip(actor.sprite, false)
	
	if distance >= 15:
		target_undetected.emit()
	elif distance < 3:
		target_encounted.emit()
	else:
		direction.y = 0
		direction = direction.normalized()
		
		actor.velocity.x = move_toward(actor.velocity.x, direction.x * actor.speed, delta * 1000)
