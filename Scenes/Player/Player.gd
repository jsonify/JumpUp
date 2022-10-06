extends KinematicBody2D

var velocity := Vector2.ZERO
const GRAVITY := 30
const JUMPFORCE := -700

var horizontal_speed := 200.0
var horizontal_direction := 1


func _physics_process(delta: float) -> void:
	if horizontal_direction == -1:
		$Sprite.flip_h = true
	
	if is_on_wall():
		horizontal_direction *= -1
		$Sprite.flip_h = !$Sprite.flip_h
		
	velocity.x = horizontal_speed * horizontal_direction
	
	velocity.y += GRAVITY
#
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
		
	velocity = move_and_slide(velocity, Vector2.UP)
