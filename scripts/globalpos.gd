extends Node
var bunny = preload("res://Scenes/Rabbit.tscn")
var wolf = preload("res://Scenes/wolf.tscn")
var bunnypos = 32
var level = 0
var next = false
func _ready():
	var bunnypos = 323
	set_fixed_process(true)

func fixed_process(delta):
	bunnypos = bunny.get_node("player").get_node("Bunny").get_global_pos()


func levels():
	if level == 0:
		get_tree().change_scene("res://Scenes/testlevel.tscn")
	if level == 1:
		get_tree().change_scene("res://Scenes/testlevel2.tscn")