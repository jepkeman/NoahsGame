extends KinematicBody2D
var facing = 1
var motion = Vector2()
var jumped = 0
signal downplat

const UP = Vector2(0, -1)

func _physics_process(delta):
	motion.y += 4
	print (motion.y)
	if Input.is_action_pressed("ui_down"):
		emit_signal("downplat")
	if is_on_floor():
		jumped = 0
	if jumped != 1:
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -150
			jumped = 1
			$AnimatedSprite.animation = "jump"
			$AnimatedSprite.offset.x = 0
	if !is_on_floor():
		jumped = 1
		if motion.y > 9:
			$AnimatedSprite.animation = "fall"
			$AnimatedSprite.offset.x = 0
		else:
			if motion.y <= 1:
				$AnimatedSprite.animation = "jump"
				$AnimatedSprite.offset.x = 0

	if Input.is_action_pressed("ui_right"): #####Moving Right
		motion.x = 125
		if is_on_floor():
			$AnimatedSprite.offset.x = -5
			$AnimatedSprite.animation = "walk"
		facing = 1
	elif Input.is_action_pressed("ui_left"): ####Moving Left
		motion.x = -125
		if is_on_floor():
			$AnimatedSprite.animation = "walk"
			$AnimatedSprite.offset.x = +5
		facing = 0
	else:
		motion.x = lerp(motion.x, 0, .2)
		if is_on_floor():
			$AnimatedSprite.animation = "idle"
			$AnimatedSprite.offset.x = 0


	if facing <= 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false


	motion = move_and_slide(motion, UP)
 

	pass