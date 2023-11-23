extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#change scene to world2
func _on_Start_pressed():
	get_tree().change_scene("res://scene/World2.tscn") # Replace with function body.

#quit the godot project
func _on_Quit_pressed():
	get_tree().quit() # Replace with function body.

func _on_Gamebtn_pressed():
	get_tree().change_scene("res://scene/GamePlay.tscn")
