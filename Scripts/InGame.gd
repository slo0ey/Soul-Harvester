extends Node2D

@onready var player: Player = $Player
@onready var monster1: Monster1 = $"Monster-1"

# Called when the node enters the scene tree for the first time.
func _ready():
	monster1.target = player
