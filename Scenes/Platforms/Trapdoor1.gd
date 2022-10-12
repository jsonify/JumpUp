extends StaticBody2D

onready var animated_sprite := $AnimatedSprite
onready var coll_shape := $CollisionShape2D


func _ready() -> void:
	var checkpoint = get_tree().get_root().find_node("Checkpoint", true, false)
	checkpoint.connect("checkpoint_reached", self, "handle_checkpoint_reached")
	
func handle_checkpoint_reached():
	coll_shape.set_deferred("disabled", false)
	print("Checkpoint has been reached, son.")
	
func _process(delta: float) -> void:
	
	pass

func trapdoor1_close():
	pass
#	print("collision_shape is disabled: ", collision_shape.disabled)

