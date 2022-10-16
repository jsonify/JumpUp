extends "Trapdoor.gd"

func _ready() -> void:
#	this will get the checkpoint2 node
	var checkpoint = get_tree().get_root().find_node("Checkpoint2", true, false)
#	this will connect to the signal in the checkpoint
	checkpoint.connect("checkpoint2_reached", self, "handle_checkpoint_reached")
	animation_player.play("open")
	
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
