extends Node2D

@onready var player: Player = $Player
@onready var monsters: Node2D = $Monsters

# Called when the node enters the scene tree for the first time.
func _ready():
	for monster in monsters.get_children():
		(monster as Enemy).target = player
