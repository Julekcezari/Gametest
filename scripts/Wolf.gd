extends KinematicBody2D

#Newton's Curse
const gravity = Vector2(0, 1200)
#movementvar
const floornormal = Vector2(0,-1)
const slopefriction = 20
const spd = 1
const jumplimit = 0.2
var accel = 1
var velocity = Vector2()
var jumpforce = 300
var movement = 0
var wolfpos
var attackbunny = false
var bunny
func _ready():
	set_fixed_process(true)


func _fixed_process(delta):
	velocity += gravity * delta 
	velocity = move_and_slide(velocity, floornormal, slopefriction)
	velocity.x = lerp(velocity.x, movement, accel)
	
	if attackbunny == true:
		bunnyfollow()
	else:
		movement = 0
	
func _on_Area2D_body_enter( body ):
	if (body.get_name() == "Bunny"):
		print("KILL ", body.get_name())
		get_tree().change_scene("res://Scenes/Gameover.tscn")

func _on_attack_body_enter( body ):
	print(body)
	if (body.get_name() == "Bunny"):
		print("attack!")
		attackbunny = true

func _on_attack_body_exit( body ):
	if (body.get_name() == "Bunny"):
		print("can't see")


func bunnyfollow():
	wolfpos = get_global_pos()
	bunny = globalpos.bunnypos
	if bunny.x > wolfpos.x:
		movement += 5
		if movement >= 0:
			get_node("Sprite").set_flip_h(true)
			movement = 120

	if bunny.x < wolfpos.x:
		movement -= 5
		if movement <= 0:
			get_node("Sprite").set_flip_h(false)
			movement = -120

func _on_jump_body_enter( body ):
	if (body.get_name() == "Map"):
		velocity.y = -jumpforce
