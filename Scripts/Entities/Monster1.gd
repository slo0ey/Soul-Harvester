extends CharacterBody2D
class_name Monster1

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_monster: Sprite2D = $SpriteMonster
@onready var flame_attack_hitbox: Area2D = $SpriteMonster/FlameAttackHitbox

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func apply_flip(flip: bool):
	if flip:
		sprite_monster.apply_scale(Vector2(-1, 1))
	else:
		sprite_monster.apply_scale(Vector2(1, 1))
