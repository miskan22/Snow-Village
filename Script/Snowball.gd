extends Area2D

const SPEED = 100
var velocity = Vector2()
var direction = 1 #1 represents right side, -1 represents left side.

func _ready():
	pass
	
func set_snowball_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	$AnimatedSprite.play("shoot")

func _on_Snowball_body_entered(body):
	if "MoveE" in body.name:
		body.dead()
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

