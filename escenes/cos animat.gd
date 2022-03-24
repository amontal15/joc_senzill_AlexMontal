extends KinematicBody2D


var velocitat_base= 200
var velocitat= Vector2.ZERO
var direccio = Vector2.DOWN
var gravetat= Vector2.DOWN * 980
var velocitat_salt = -400
var  njump = 2


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	velocitat += gravetat * delta
	velocitat.x = 0
	if Input.is_action_pressed("Mou dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
		
	if Input.is_action_pressed("mou esquerra"):
		velocitat += Vector2.LEFT * velocitat_base	
	
	if is_on_floor():
		njump=99
	if Input.is_action_just_pressed("mou a dalt ") and njump>0:
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
