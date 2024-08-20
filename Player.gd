extends KinematicBody2D
const UP = Vector2(0, -1)
const GRAVITY = 16
const SPEED = 140
const JUMP_HEIGHT = -400

var can_release = true
var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	if Input.is_action_pressed("ui_right"):
		$right.disabled = false
		$left.disabled = true
		motion.x = SPEED
		$Sprites.flip_h = false
		$Sprites.play("walk")
		if is_on_floor() and $step_stream.playing == false:
			$step_stream.play()
	elif Input.is_action_pressed("ui_left"):
		$right.disabled = true
		$left.disabled = false
		motion.x = -SPEED
		$Sprites.flip_h = true
		$Sprites.play("walk")
		if is_on_floor() and $step_stream.playing == false:
			$step_stream.play()
	else:
		$step_stream.stop()
		$Sprites.play("idle")
		motion.x = 0
	if is_on_floor():
		if Input.is_action_pressed("ui_up", 10):
			
			can_release = true
			motion.y = JUMP_HEIGHT
			$jump_stream.play()
	else:
		$step_stream.stop()
	if Input.is_action_just_released("ui_up") and can_release == true:
		motion.y = motion.y / 2
		can_release = false
	motion = move_and_slide(motion, UP)
	


func _on_jump_stream_finished():
	$jump_stream.stop()
