extends StaticBody2D

onready var animated_sprite := $AnimatedSprite
onready var animation_player := $AnimationPlayer
onready var coll_shape := $CollisionShape2D
var trapdoor_triggered := false


func _ready() -> void:
#	this will get the Checkpoint1 node
	var checkpoint = get_tree().get_root().find_node("Checkpoint1", true, false)
#	this will connect to the signal in the checkpoint
	checkpoint.connect("checkpoint1_reached", self, "handle_checkpoint_reached")
	animated_sprite.visible = false
	
func _process(delta: float) -> void:
		if trapdoor_triggered:
			animation_player.play("closing")
			yield(get_tree().create_timer(0.5),"timeout")
			animation_player.play("closed")
			

func handle_checkpoint_reached():
	if trapdoor_triggered == false:
		trapdoor1_close()
		trapdoor_triggered = true
		
	

func trapdoor1_close():
	coll_shape.set_deferred("disabled", false)
#	animated_sprite.visible = true

