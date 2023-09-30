extends CharacterBody2D
@onready var player_preload = preload("res://Scenes/player.tscn")

var player = player_preload
func _process(delta):
	position += Vector2(0.5, 0.5)
