extends StaticBody2D
class_name Trapdoor1

onready var animated_sprite := $AnimatedSprite
onready var collision_shape := $CollisionShape2D


func _ready() -> void:
	collision_shape.set_deferred("disabled", true)
	
	
func _process(delta: float) -> void:
#	collision_shape.disabled = false
	pass

func trapdoor1_close():
	collision_shape.set_deferred("disabled", false)
	print("collision_shape is disabled: ", collision_shape.disabled)

