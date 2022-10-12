extends StaticBody2D

onready var animated_sprite := $AnimatedSprite
onready var coll_shape := $CollisionShape2D


func _ready() -> void:
#	this will get the Checkpoint1 node
	var checkpoint = get_tree().get_root().find_node("Checkpoint1", true, false)
#	this will connect to the signal in the checkpoint
	checkpoint.connect("checkpoint1_reached", self, "handle_checkpoint_reached")
	
func handle_checkpoint_reached():
	trapdoor1_close()
	

func trapdoor1_close():
	coll_shape.set_deferred("disabled", false)

