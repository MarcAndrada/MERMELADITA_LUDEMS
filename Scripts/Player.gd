extends RigidBody2D
#Variables de la velocidad
	
@onready var inputValue := Vector2.ZERO
@onready var acceleration := 0.0
@export var speed := 300.0
@export var accelerationSpeed := 100.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	MovePlayer(delta)
	



func MovePlayer(delta):
	inputValue = Vector2.ZERO
	#Read Inputs
	if Input.is_action_pressed("MoveDown"):
		inputValue.y += 1
	if Input.is_action_pressed("MoveUp"):
		inputValue.y -= 1
	if Input.is_action_pressed("MoveRight"):
		inputValue.x += 1
	if Input.is_action_pressed("MoveLeft"):
		inputValue.x -= 1
		
	
	
	if inputValue == Vector2.ZERO:
		acceleration = 0.0
	else:
		acceleration += accelerationSpeed * delta
		
		if acceleration > 1:
			acceleration = 1
		
		inputValue = inputValue.normalized()
	
	#Apply speed
	linear_velocity = inputValue * speed * acceleration * delta
	print(linear_velocity)
	

func ChangeRotation(delta):
	pass

