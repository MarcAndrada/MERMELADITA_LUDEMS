extends RigidBody2D

var d:= 0.0
var radius := 500.0
var speed := 0.80
@onready var enemy_preload = preload("res://Scenes/enemyBalls.tscn")


func _instantiateEnemies():
	if Input.is_action_just_pressed("ui_accept"):
		var enemy = enemy_preload.instantiate()
		add_child(enemy)
		
		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	d+= delta
	position = Vector2(sin(d * speed) * radius, cos(d* speed) * radius) + Vector2(800, 450)
	
	_instantiateEnemies()
	
	
