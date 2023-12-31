extends Label
#story line promoted

var drawTextSpeed: int = 0
var chatterLimit: int = 100 # max characters in chatbox
var dialog = [] # list of story lines

var page = 0

func _loadDialogFromFile(fname):
	
	var f = File.new()
	f.open(fname, File.READ)
	var index = 1
	while not f.eof_reached():
		var line = f.get_line()
		dialog.append(line)
		index+=1
	f.close()
	
	# initialise first line of chat and set the chat box text
	set_text(dialog[page])
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Print story line by line
func _showChatter():
	if drawTextSpeed < chatterLimit: # print 1 char at a time
		drawTextSpeed += 1
		self.visible_characters = drawTextSpeed
	pass
	
func _process(delta):
	_showChatter()
	pass

func _on_SkipStoryLines_pressed():
	if page < dialog.size()-1:
		page += 1
		set_text(dialog[page])
	else:
		page = 0
		set_text(dialog[page])
		
	# reset chatter box method to show new chat line
	drawTextSpeed = 0
	_showChatter()
	pass # Replace with function body.
