extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/MainHud").lives -= 0
	pass

func _on_Person2_body_exited(body):
	pass # Replace with function body.
