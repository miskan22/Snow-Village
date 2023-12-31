extends KinematicBody2D

export var move_speed = 0.5
export var move_distance = 100.0

#Zero vector, a vector with all components set to 0.
export var move_direction = Vector2(0, 0) # direction to move right to left

var time_since_init = 0
var origin = Vector2(0,0) # direction to move right to left

# Called when the node enters the scene tree for the first time.
func _ready():
	time_since_init = 0.0
	origin = position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	time_since_init = time_since_init + delta
	var position_on_curve = sin(time_since_init * PI * move_speed)
	var offset = move_distance * position_on_curve * move_direction
	position = origin + offset
	pass
