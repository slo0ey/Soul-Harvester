class_name Monster6_Explode
extends State

const PoisonBall = preload("res://Scenes/Entities/poison_ball.tscn")
const Utils = preload("res://Scripts/Utils.gd")

func _ready():
	set_physics_process(false)

func _enter_state():
	set_physics_process(true)
	actor.animator.play("Explode")
	actor.animator.animation_finished.connect(on_animation_finish)
	
	spawn_balls()

func _exit_state():
	set_physics_process(false)

func _physics_process(delta):
	if actor.explosion_hitbox.overlaps_body(actor.target):
		print("Explosion Damage")
	
func spawn_balls():
	var spawn_pos = actor.pb_spawn_pos.global_position
	
	for i in range(3):
		var poison_ball := PoisonBall.instantiate()
		poison_ball.mode = i
		poison_ball.global_position = spawn_pos
		actor.get_window().get_node("InGame").add_child(poison_ball)

func on_animation_finish(_name):
	actor.queue_free()
