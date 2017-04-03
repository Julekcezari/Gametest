extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Area2D_body_enter( body ):
	if (body.get_name() == "Bunny"):
		print("KILL ", body.get_name())
		get_tree().change_scene("res://Scenes/Gameover.tscn")
	if(body.get_name() == "wolf"):
		print("KILL ", body.get_name())
		body.free()