class_name Utils
extends Object

static func apply_flip(flip_target: Node2D, flip_x: bool = false, flip_y: bool = false):
	var ratio := Vector2(
		-1 if flip_x else 1,
		-1 if flip_y else 1
	)
	flip_target.apply_scale(ratio)
