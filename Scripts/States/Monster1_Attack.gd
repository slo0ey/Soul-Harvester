extends State
class_name Monster1_Attack

@export var monster: Monster1
var player: CharacterBody2D

func Enter():
	monster.animation_player.animation_finished.connect(on_attack_end)
	monster.animation_player.play("Attack")

func Physics_Update(_delta):
	var direction = player.global_position - monster.global_position
	var distance = direction.length_squared()
	
	if monster.flame_attack_hitbox.overlaps_body(player):
		print("It hurts...")
	
	if direction.x < 0:
		monster.apply_flip(true)
	else:
		monster.apply_flip(false)

func on_attack_end():
	var direction = player.global_position - monster.global_position
	var distance = direction.length_squared()
	
	if distance < 15:
		Transitioned.emit(self, "Idle")
	elif distance >= 3:
		Transitioned.emit(self, "Follow")
	else:
		monster.animation_player.play("Attack")
