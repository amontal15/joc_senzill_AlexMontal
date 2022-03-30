extends KinematicBody2D


var velocitat_base= 200
var velocitat= Vector2.ZERO
var direccio = Vector2.DOWN
var gravetat= Vector2.DOWN * 980
var velocitat_salt = -400
var  njump = 2

export var jugador = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	velocitat += gravetat * delta
	velocitat.x = 0
	if jugador==1:
		if Input.is_action_pressed("dreta_1"):
			velocitat += Vector2.RIGHT * velocitat_base
			
		if Input.is_action_pressed("esquerra_1"):
			velocitat += Vector2.LEFT * velocitat_base	
		
		if is_on_floor():
			njump=2
		if Input.is_action_just_pressed("salta_1") and njump>0:
			velocitat.y = velocitat_salt
			njump += -1
	if jugador==2:
		if Input.is_action_pressed("dreta_2"):
			velocitat += Vector2.RIGHT * velocitat_base
			
		if Input.is_action_pressed("esquerra_2"):
			velocitat += Vector2.LEFT * velocitat_base	
		
		if is_on_floor():
			njump=2
		if Input.is_action_just_pressed("salta_2") and njump>0:
			velocitat.y = velocitat_salt
			njump += -1
	velocitat = move_and_slide(velocitat, Vector2.UP)
	anima(velocitat)
	
func anima (velocitat):
	if velocitat.x > 0.5:
		$AnimatedSprite.play("corre")
		$AnimatedSprite.flip_h= false
	if velocitat.x < 0.5:
		$AnimatedSprite.play("corre")
		$AnimatedSprite.flip_h= true
	if abs(velocitat.x)< 0.5:
		$AnimatedSprite.play("dret")
	if velocitat.y < -1:
		$AnimatedSprite.play("salta")
