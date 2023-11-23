extends KinematicBody2D

const SPEED = 200
const GRAVITY = 20
const JUMP_HEIGHT = -700
const UP = Vector2(0, -1) #FLOOR

const SNOWBALL = preload("res://scene/Snowball.tscn")

#velocity
var motion = Vector2() # moving in 2d space

var on_ground = false

var is_attacking = false

# Called when the node enters the scene tree for the first time.
	
func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		if is_attacking == false || is_on_floor() == false:
			motion.x = SPEED
			if is_attacking == false:
				$Sprite.play("Run")
				$Sprite.flip_h = false #flip sprite to face direction
				#if the character is on the left side snowball goes to the opposite side
				if sign($Position2D.position.x) == -1:
					$Position2D.position.x *= -1
	elif Input.is_action_pressed("ui_left"):
		if is_attacking == false || is_on_floor() == false:
			motion.x = -SPEED
			if is_attacking == false:
				$Sprite.play("Run")
				$Sprite.flip_h = true #flip sprite to face direction
				if sign($Position2D.position.x) == 1:
					$Position2D.position.x *= -1
	else:
		motion.x = 0
		if on_ground == true && is_attacking == false:
			$Sprite.play("Idle")
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			if is_attacking == false:
				if on_ground == true:
						motion.y = JUMP_HEIGHT
						on_ground = false
	
	if Input.is_action_just_pressed("ui_focus_next") && is_attacking == false:
		if is_on_floor():
			motion.x = 0
		is_attacking = true
		$Sprite.play("Attack")
		var snowball = SNOWBALL.instance()
		if sign($Position2D.position.x) == 1:
			snowball.set_snowball_direction(1)
		else:
			snowball.set_snowball_direction(-1)
		get_parent().add_child(snowball)
		snowball.position = $Position2D.global_position
	
	motion.y += GRAVITY
	
	if is_on_floor():
		if on_ground == false:
			is_attacking = false
		on_ground = true
	else:
		if is_attacking == false:
			on_ground = false
			if motion.y < 0:
				$Sprite.play("Jump")
			else:
				$Sprite.play("Fall")
			
	motion = move_and_slide(motion, UP)
	
	pass

func _on_Sprite_animation_finished():
	is_attacking = false
