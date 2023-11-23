extends Node2D
var pies = 0 setget set_pies
var lives = 3 setget set_lives
var max_score = 10

func _process(_delta):
	get_node("/root/MainHud/HUD/Pies").show()
	get_node("/root/MainHud/HUD/Lives").show()
	
	if get_tree().current_scene.name == "World1":
		get_node("/root/MainHud/HUD/Pies").hide()
		get_node("/root/MainHud/HUD/Lives").hide()
		
	if get_tree().current_scene.name == "World2":
		get_node("/root/MainHud/HUD/Pies").hide()
		get_node("/root/MainHud/HUD/Lives").hide()
		
	if get_tree().current_scene.name == "Dead":
		get_node("/root/MainHud/HUD/Pies").hide()
		get_node("/root/MainHud/HUD/Lives").hide()
		
	if get_tree().current_scene.name == "Ending":
		get_node("/root/MainHud/HUD/Pies").hide()
		get_node("/root/MainHud/HUD/Lives").hide()
		
	if get_tree().current_scene.name == "GamePlay":
		get_node("/root/MainHud/HUD/Pies").hide()
		get_node("/root/MainHud/HUD/Lives").hide()
	
	if get_tree().current_scene.name == "Final":
		get_node("/root/MainHud/HUD/Pies").hide()
		get_node("/root/MainHud/HUD/Lives").hide()
	pass
	
func set_pies(value):
	#set method
	pies = value
	#look at the score in HUD and set score as text
	#$HUD/Pies.set_text("PIES: "+str(pies))
	get_node("/root/MainHud/HUD/Pies").set_text("PIES: "+str(pies))
	if pies >= max_score:
		get_tree().change_scene("res://scene/Ending.tscn")
		
		pies = 0
		lives = 3
		get_node("/root/MainHud/HUD/Pies").set_text("PIES: "+str(pies))
		get_node("/root/MainHud/HUD/Lives").set_text("LIVES: "+str(lives))
	pass
	
func set_lives(value):
	#set method
	lives = value
	#$HUD/Lives.set_text("LIVES: "+str(lives))
	get_node("/root/MainHud/HUD/Lives").set_text("LIVES: "+str(lives))
	if lives <= 0:
		#needs to create dead scene and then it will start beggining of world1
		#create button and put
		get_tree().change_scene("res://scene/Dead.tscn")
		
		pies = 9
		lives = 3
		get_node("/root/MainHud/HUD/Lives").set_text("LIVES: "+str(lives))
		get_node("/root/MainHud/HUD/Pies").set_text("PIES: "+str(pies))
	pass
