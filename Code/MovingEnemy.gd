extends "res://script/MainHUD.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_MovingEnemy_body_entered(body):
	if body.name == "Player":
		#update HUD
		get_node("/root/MainHud").lives -= 1
		#get_node("/root/MainHud").pies -= 1
		
		#kill enemy
		queue_free()
	pass # Replace with function body.
