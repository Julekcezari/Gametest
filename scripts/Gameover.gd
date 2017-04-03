extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_fixed_process(true)


func _fixed_process(delta):
	if(Input.is_action_pressed("ui_accept")):
		globalpos.level = 0
		get_tree().change_scene("res://Scenes/testlevel.tscn")