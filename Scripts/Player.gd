class_name Player
extends Entity

@export var camera_area: Area2D

@onready var sprite_bg := $SpriteBG
@onready var camera := $Camera2D

const Utils = preload("res://Scripts/Utils.gd")
const BG_ROTATE_SPEED := PI * 3

func _ready():
	eye_direction = Vector2.RIGHT

func _physics_process(delta):
	var direction = get_input_direction()
	var new_eye_direction = eye_direction
	
	velocity.x = move_toward(velocity.x, direction.x * speed, delta * 1000)
	velocity.y = move_toward(velocity.y, direction.y * speed, delta * 1000)
	
	if velocity.x < 0:
		new_eye_direction = Vector2.LEFT
	elif velocity.x > 0:
		new_eye_direction = Vector2.RIGHT
	
	if new_eye_direction != eye_direction:
		Utils.apply_flip(self, true)
		eye_direction = new_eye_direction
	
	sprite_bg.rotate(delta * BG_ROTATE_SPEED)
	
	move_and_slide()
