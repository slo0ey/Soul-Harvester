class_name Monster1_Idle
extends State

signal target_detected

func _ready():
	set_physics_process(false)

func _enter_state():
	set_physics_process(true)
	actor.animator.play("Walk")

func _exit_state():
	set_physics_process(false)

func _physics_process(delta):
	var target = actor.target
	
	if target:
		var direction = target.global_position - actor.global_position
		
		if direction.length_squared() < 15:
			target_detected.emit()