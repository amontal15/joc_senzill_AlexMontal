extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var puntuacio1 =0
var puntuacio2 =0
# Called when the node enters the scene tree for the first time.
func _ready():
	set_weight(3.0)
	set_mass(9.8)
	set_bounce(0.5)
	
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.y >= 400:
	get_tree().change_scene("res://escena 2.tscn")
