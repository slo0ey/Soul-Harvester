class_name Monster6
extends Enemy

const Utils = preload("res://Scripts/Utils.gd")

@onready var explosion_hitbox: Area2D = $Sprite/ExplosionHitbox
@onready var pb_spawn_pos: Node2D = $PoisonBallSpawnPos
@onready var explosion_await_timer: Timer = $ExplosionAwaitTimer
@onready var fragment_splattering_timer: Timer = $FragmentSplatteringTimer

# States
@onready var idle: Monster6_Idle = $StateMachine/Idle
@onready var chase: Monster6_Chase = $StateMachine/Chase
@onready var ignite: Monster6_Ignite = $StateMachine/Ignite
@onready var explode: Monster6_Explode = $StateMachine/Explode

func _ready():
	fsm.run()
	
	idle.target_detected.connect(fsm.change_state.bind(chase))
	chase.target_undetected.connect(fsm.change_state.bind(idle))
	chase.target_encounted.connect(fsm.change_state.bind(ignite))
	ignite.cancel_explosion.connect(fsm.change_state.bind(chase))
	ignite.explode.connect(fsm.change_state.bind(explode))
