extends StaticBody2D
class_name Trapdoor1

onready var animated_sprite := $AnimatedSprite
onready var collision_shape := $CollisionShape2D

enum states {
	OPEN,
	CLOSED,
	CLOSING
}

var state
var is_closed := true
var state_queue = []

func _ready() -> void:
	state = states.OPEN
	
func _process(delta: float) -> void:
	match state:
		states.OPEN:
			if is_closed:
				animated_sprite.play("open")
				yield(animated_sprite, "animation_finished")
				collision_shape.disabled = true
				is_closed = false
		states.CLOSING:
			if not is_closed:
				animated_sprite.play("closing")
				yield(animated_sprite, "animation_finished")
				is_closed = true
		states.CLOSED:
			if is_closed:
				collision_shape.disabled = false
				animated_sprite.play("closed")
	
	if state_queue.size() > 0:
#		the next stat is the last element/state in the array
		var next_state = state_queue.back()
		if state == next_state:
			return
		if next_state == states.CLOSING:
			if state == states.OPEN:
				state_queue.clear()
				return
			if state == states.CLOSED:
				state = states.CLOSING
				state_queue.clear()
				return
		if next_state == states.CLOSED:
			state = states.OPEN
			

func trapdoor1_close():
	pass

