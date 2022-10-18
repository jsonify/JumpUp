extends KinematicBody2D

onready var player_sprite := $Sprite
class_name Player

var velocity := Vector2.ZERO
var prizes := 0
const GRAVITY := 30
const JUMPFORCE := -700

var horizontal_speed := 200.0
var horizontal_direction := 1

var screen_size := Vector2.ZERO

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _physics_process(_delta: float) -> void:
	if horizontal_direction == -1:
		$Sprite.flip_h = true
	
	if is_on_floor():
		pass
		# player_sprite.animation = "Jump"

	if is_on_wall():
		horizontal_direction *= -1
		$Sprite.flip_h = !$Sprite.flip_h
		
	velocity.x = horizontal_speed * horizontal_direction
	
	velocity.y += GRAVITY
#
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
		# player_sprite.animation = "Jump"

		
	velocity = move_and_slide(velocity, Vector2.UP)
	
	wormhole_teleporter()

func wormhole_teleporter():
	global_position.x = wrapf(global_position.x, 0, screen_size.x)


func _on_Checkpoint_body_entered(_body: Node) -> void:
	queue_free()
