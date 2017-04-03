extends KinematicBody2D

#Newton's Curse
const gravity = Vector2(0, 600)
#movementvar
const floornormal = Vector2(0,-1)
const slopefriction = 20
const spd = 150
const jumplimit = 0.2
var accel = 1
var velocity = Vector2()
var jump = false
var jumpforce = 250
var jumpchance = 0
var mypos = 23

var reaction = false
var calm = 0
func _ready():
	set_fixed_process(true)


func _fixed_process(delta):
	globalpos.bunnypos = get_global_pos()
	#Newton's intensifies
	velocity += gravity * delta 
	velocity = move_and_slide(velocity, floornormal, slopefriction)
	
	#Movement
	var movement = 0
	if(Input.is_action_pressed("ui_right")):
		movement += 1
		get_node("AnimatedSprite").set_flip_h(true)
		get_node("reaction").set_offset(Vector2(8,0))
	if(Input.is_action_pressed("ui_left")):
		movement -= 1
		get_node("AnimatedSprite").set_flip_h(false)
		get_node("reaction").set_offset(Vector2(0,0))
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

#self destruct game
	if Input.is_key_pressed(81):
		get_tree().quit()

#restart game
	if Input.is_key_pressed(82):
		get_tree().reload_current_scene()

	if reaction == true:
		get_node("reaction").show()
		calm += delta
	if calm > 0.7:
		reaction = false
		get_node("reaction").hide()

func _on_Area2D_body_enter( body ):
	if (body.get_name() == "wolf"):
		print("oh shit")
		reaction = true

func _on_Area2D_body_exit( body ):
	calm = 0