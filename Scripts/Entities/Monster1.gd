class_name Monster1
extends Enemy

const Utils = preload("res://Scripts/Utils.gd")

@onready var flame_attack_hitbox: Area2D = $Sprite/FlameAttackHitbox

# States
@onready var idle: Monster1_Idle = $StateMachine/Idle
@onready var chase: Monster1_Chase = $StateMachine/Chase
@onready var attack: Monster1_Attack = $StateMachine/Attack

func _ready():
	fsm.run()
	
	idle.target_detected.connect(fsm.change_state.bind(chase))
	chase.target_undetected.connect(fsm.change_state.bind(idle))
	chase.target_encounted.connect(fsm.change_state.bind(attack))
	attack.attack_end_target_follow.connect(fsm.change_state.bind(chase))
