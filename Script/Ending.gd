extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Button_pressed():
	get_tree().change_scene("res://scene/World1.tscn")


func _on_QuitBtn_pressed():
	get_tree().quit()
