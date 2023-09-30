extends RigidBody2D

var d:= 0.0
var radius := 500.0
var speed := 0.80

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	d += delta
	position = Vector2(sin(d * speed) * radius, cos(d* speed) * radius) + Vector2(800, 450)

	
	
