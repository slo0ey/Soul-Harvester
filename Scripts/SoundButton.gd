extends Button
class_name SoundButton

@export var hover_sound: AudioStream
@export var click_sound: AudioStream

@onready var hover_sound_player := AudioStreamPlayer.new()
@onready var click_sound_player := AudioStreamPlayer.new()


func _ready():
	hover_sound_player.stream = hover_sound
	click_sound_player.stream = click_sound
	
	mouse_entered.connect(func(): hover_sound_player.play())
	pressed.connect(func(): click_sound_player.play())
	
	add_child(hover_sound_player)
	add_child(click_sound_player)
