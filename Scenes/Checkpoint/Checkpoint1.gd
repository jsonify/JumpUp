extends "Checkpoint.gd"

func apply_effect(body: Node):
	print(body.name)


func _on_Checkpoint1_body_entered(body: Node) -> void:
	if body is Player:
		trapdoor1_close()


func trapdoor1_close():
	get_node("Trapdoor1").trapdoor1_close()
	
