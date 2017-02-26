extends KinematicBody2D

#Newton's Curse
const gravity = Vector2(0, 600)
#movementvar
const floornormal = Vector2(0,-1)
const slopefriction = 20
const spd = 100
const jumplimit = 0.2
var accel = 1
var velocity = Vector2()
var jump = false
var jumpforce = 200
var jumpchance = 0

func _ready():
	set_fixed_process(true)
	

func _fixed_process(delta):
	#Newton's intensifies
	velocity += gravity * delta 
	velocity = move_and_slide(velocity, floornormal, slopefriction)
	
	
	#Movement
	var movement = 0
	if(Input.is_action_pressed("ui_right")):
		movement += 1
	if(Input.is_action_pressed("ui_left")):
		movement -= 1
	movement *= spd
	velocity.x = lerp(velocity.x, movement, accel)
	
	#defying newton
	jumpchance += delta
	if(is_move_and_slide_on_floor()):
		jumpchance = 0
	jump = jumpchance < jumplimit
	if(jump && Input.is_action_pressed("ui_up")):
		velocity.y -= jumpforce
		jumpchance = jumplimit