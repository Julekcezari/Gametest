extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func _ready():
	set_fixed_process(true)

func _on_Area2D_body_enter( body ):
	if (body.get_name() == "Bunny"):
		get_tree().change_scene("res://Scenes/nextlevel.tscn")
