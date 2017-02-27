extends KinematicBody2D

#Newton's Curse
const gravity = Vector2(0, 600)
#movementvar
const floornormal = Vector2(0,-1)
const slopefriction = 20
const spd = 1
const jumplimit = 0.2
var accel = 1
var velocity = Vector2()
var jumpforce = 200
var movement = 0
func _ready():
	set_fixed_process(true)


func _fixed_process(delta):
	#Newton's intensifies
	velocity += gravity * delta 
	velocity = move_and_slide(velocity, floornormal, slopefriction)
	velocity.x = lerp(velocity.x, movement, accel)
	
func _on_Area2D_body_enter( body ):
	if (body.get_name() == "Bunny"):
		print("KILL ", body.get_name())
		get_tree().reload_current_scene()



func _on_attack_body_enter( body ):
	if (body.get_name() == "Bunny"):
		print("attack!")


func _on_attack_body_exit( body ):
	if (body.get_name() == "Bunny"):
		print("can't see it")
