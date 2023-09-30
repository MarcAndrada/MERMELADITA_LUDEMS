extends RigidBody2D
#Variables de la velocidad
@onready var inputValue := Vector2.ZERO
@onready var acceleration := 0.0
@onready var speed := 20000.0
@onready var accelerationSpeed := 100.0

#Variables Parry
@onready var isParring := false
@onready var canParry := true
@onready var parryDuration : float = 1.0
@onready var timeWaitedParring : float = 0.0
@onready var parryCD : float = 1.0
@onready var timeWaitedParryCD : float = 0.0

@onready var minScale : float= 1.0
@onready var maxScale : float= 3.0
@onready var lerpProcess : float
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta : float):
	MovePlayer(delta)
	Parry(delta)



func MovePlayer(delta : float):
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


func Parry(delta : float):
	#Activar Parry
	if Input.is_action_just_pressed("Parry") && !isParring && canParry:
		isParring = true
		canParry = false
	
	if isParring:
		#Espera la duracion del parry
		DoingParry(delta)
	elif !canParry:
		#Espera al CD del parry
		WaitParryCD(delta)
	
	ScalingParry(delta)

func DoingParry(delta : float):
	timeWaitedParring += delta
	if timeWaitedParring >= parryDuration:
		timeWaitedParring = 0.0
		lerpProcess = 0.0
		isParring = false

func WaitParryCD(delta : float):
	timeWaitedParryCD += delta
	if timeWaitedParryCD >= parryCD:
		timeWaitedParryCD = 0.0
		canParry = true
		lerpProcess = 0.0

func ScalingParry(delta : float):
	if isParring:
		lerpProcess += (parryDuration / 2) * delta   
		if lerpProcess > 1:
			lerpProcess = 1
		var lerpValue = lerp(minScale, maxScale, lerpProcess)
		$MainSprite.scale = Vector2(lerpValue,lerpValue)
		print("Escalando", lerpValue)
	elif $MainSprite.scale.x > 1:
		lerpProcess += (parryCD / 2) * delta
		if lerpProcess > 1:
			lerpProcess = 1
		var lerpValue = lerp(maxScale, minScale, lerpProcess)
		$MainSprite.scale = Vector2(lerpValue,lerpValue)
		print("Escalando", lerpValue)
		
