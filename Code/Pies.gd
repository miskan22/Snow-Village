extends "res://script/MainHUD.gd"

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


func _on_Pies_body_entered(body):
	if body.name == "Player":
		get_node("/root/MainHud").pies += 1
		queue_free()
	pass # Replace with function body.
