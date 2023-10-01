extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CPUParticles2D.emitting = false
	if Input.is_action_pressed("MoveDown"):
		$CPUParticles2D.emitting = true
		$CPUParticles2D.scale.y = 1
		position.y += 10
	if Input.is_action_pressed("MoveUp"):
		$CPUParticles2D.emitting = true
		$CPUParticles2D.scale.y = -1
		position.y -= 10
	if Input.is_action_pressed("MoveLeft"):
		$CPUParticles2D.emitting = true
		$CPUParticles2D.scale.x = -1
		position.x -= 10
	if Input.is_action_pressed("MoveRight"):
		$CPUParticles2D.emitting = true
		$CPUParticles2D.scale.x = 1
		position.x += 10

