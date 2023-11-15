extends Button
class_name SoundButton

@export var hover_sound: AudioStream
@export var click_sound: AudioStream

@onready var hover_sound_player := AudioStreamPlayer.new()
@onready var click_sound_player := AudioStreamPlayer.new()


func _ready():
	hover_sound_player.stream = hover_sound
	click_sound_player.stream = click_sound


func _on_mouse_entered():
	hover_sound_player.play()


func _on_pressed():
	click_sound_player.play()
