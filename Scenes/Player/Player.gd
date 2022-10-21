extends KinematicBody2D

onready var player_sprite := $Sprite
class_name Player

var velocity := Vector2.ZERO
var prizes := 0
var gravity := 30

var jumpforce := -700
var jumpforce_slow := -1200

var horizontal_speed := 200.0
var horizontal_speed_normal := 200.0
var horizontal_speed_dash := 400.0

var horizontal_direction := 1

var screen_size := Vector2.ZERO

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _physics_process(_delta: float) -> void:
	if horizontal_direction == -1:
		$Sprite.flip_h = true
	
	if Input.is_action_pressed("dash"):
		horizontal_speed = horizontal_speed_dash
		$Sprite.speed_scale = 4
	if Input.is_action_just_released("dash"):
		horizontal_speed = horizontal_speed_normal
		$Sprite.speed_scale = 2
	
	if Input.is_action_just_pressed("slow"):
		Engine.time_scale = 0.1
		horizontal_speed = horizontal_speed_dash
		
	if Input.is_action_just_released("slow"):
		Engine.time_scale = 1
		horizontal_speed = horizontal_speed_normal

	if is_on_wall():
		horizontal_direction *= -1
		$Sprite.flip_h = !$Sprite.flip_h
		
	velocity.x = horizontal_speed * horizontal_direction
	
	velocity.y += gravity
#
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jumpforce
		

		
	velocity = move_and_slide(velocity, Vector2.UP)
	
	wormhole_teleporter()

func wormhole_teleporter():
	global_position.x = wrapf(global_position.x, 0, screen_size.x)


func _on_Checkpoint_body_entered(_body: Node) -> void:
	queue_free()


func _on_Finish_body_entered(body: Node) -> void:
	pass # Replace with function body.
