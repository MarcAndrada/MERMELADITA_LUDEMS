extends Node2D

@onready var canon_preload = preload("res://Scenes/canon.tscn")
var canon : RigidBody2D
var enemy : CharacterBody2D
	
# Called when the node enters the scene tree for the first time.
func _ready():
	canon = canon_preload.instantiate()
	canon.position = $Marker2D.position
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	add_child(canon)
	



func _on_child_entered_tree(node):
	if node.name == "canon":
		canon = node;
	if node.name == "enemyBalls":
		enemy = node;
	
