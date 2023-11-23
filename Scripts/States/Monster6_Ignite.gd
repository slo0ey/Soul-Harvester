class_name Monster6_Ignite
extends State

const Utils = preload("res://Scripts/Utils.gd")

signal explode
signal cancel_explosion

func _ready():
	set_physics_process(false)

func _enter_state():
	set_physics_process(true)
	
	actor.animator.play("Prepare Igniting")
	actor.animator.queue("Ignite")
	actor.explosion_await_timer.timeout.connect(on_explode)
	actor.explosion_await_timer.start()
	
	actor.velocity = Vector2.ZERO

func _exit_state():
	set_physics_process(false)
	actor.animator.clear_queue()
	actor.explosion_await_timer.timeout.disconnect(on_explode)
	actor.explosion_await_timer.stop()

func _physics_process(delta):
	var target = actor.target
	var direction = target.global_position - actor.global_position
	var distance = direction.length()
	var new_eye_direction = actor.eye_direction
	
	if direction.x < 0:
		new_eye_direction = Vector2.LEFT
	elif direction.x > 0:
		new_eye_direction = Vector2.RIGHT
	
	if new_eye_direction != actor.eye_direction:
		Utils.apply_flip(actor, true)
		actor.eye_direction = new_eye_direction
	
	if distance >= 60:
		cancel_explosion.emit()

func on_explode():
	explode.emit()
