extends State
class_name Monster1_Follow

@export var monster: Monster1
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	monster.animation_player.play("Walk")

func _physics_process(delta):
	var direction = player.global_position - monster.global_position
	var distance = direction.length_squared()
	
	if direction.x < 0:
		monster.apply_flip(true)
	else:
		monster.apply_flip(false)
	
	if distance < 15:
		Transitioned.emit(self, "Idle")
	elif distance < 3:
		Transitioned.emit(self, "Attack")
	else:
		direction.y = 0
		direction = direction.normalized()
		
		monster.velocity = direction

