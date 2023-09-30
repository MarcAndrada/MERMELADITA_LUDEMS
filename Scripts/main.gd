extends Node2D

@onready var enemie_preload = preload("res://Scenes/enemigorl.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		var enemy = enemie_preload.instantiate()
		
		var pos = $positions.get_children().pick_random()
		enemy.position = pos.position
		add_child(enemy)
		$Player.di_hola()
		
