class_name Entity
extends CharacterBody2D

@export var speed: float = 100.0
@export var acceleration: float = 10.0
@export var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animator: AnimationPlayer = get_node("AnimationPlayer")
@onready var sprite: Sprite2D = get_node("Sprite")
@onready var fsm: StateMachine = get_node("StateMachine")

func _ready():
	print_tree_pretty()

func get_input_direction() -> Vector2:
	var direction := Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)
	
	if direction:
		return direction.normalized()
	else:
		return direction
