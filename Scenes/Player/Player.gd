extends KinematicBody2D

var velocity := Vector2.ZERO
const SPEED := 300
const GRAVITY := 30
const JUMPFORCE := -900

func _physics_process(delta: float) -> void:
	print(position.x)
		
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.flip_h = true
		
	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.flip_h = false
		
	velocity.y += GRAVITY
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
		
	velocity = move_and_slide(velocity, Vector2.UP)

	velocity.x = lerp(velocity.x, 0, 0.2)
