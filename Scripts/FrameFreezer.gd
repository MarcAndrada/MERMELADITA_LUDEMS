extends Node

var enable := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed(("Act3_3freeze")):
		frameFreeze(0.05, 0.025)

func frameFreeze(timeScale, duration):
	Engine.time_scale = timeScale
	await(get_tree().create_timer(duration * timeScale).timeout)
	Engine.time_scale = 1.0
	


