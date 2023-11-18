extends State
class_name Monster1_Idle

@export var monster: Monster1
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	monster.animation_player.play("Walk")

func _physics_process(delta):
	var direction = player.global_position - monster.global_position
	
	if direction.length_squared() < 15:
		Transitioned.emit(self, "Follow")
