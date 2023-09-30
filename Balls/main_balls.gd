extends Node2D

@onready var canon_preload = preload("res://Balls/canon.tscn")
@onready var enemy_preload = preload("res://Balls/enemyBalls.tscn")

var canonInstance
# Called when the node enters the scene tree for the first time.
func _ready():
	_instantiateCanon($Marker2D.position)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		_instantiateEnemies()
		
func _instantiateCanon(pos):
	canonInstance = canon_preload.instantiate()
	add_child(canonInstance)
	canonInstance.position = pos
	
func _instantiateEnemies(): 
		var enemyInstance = enemy_preload.instantiate()
		add_child(enemyInstance)
		enemyInstance.position = canonInstance.position
 
