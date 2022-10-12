extends "Checkpoint.gd"

#func apply_effect(body: Node):
#	print(body.name)
#onready var trapdoor1 = Trapdoor1.new()

func _on_Checkpoint1_body_entered(body: Node) -> void:
	if body is Player:
#		trapdoor1_close()
		print("Checkpoint1 accessed")

func trapdoor1_close():
#	trapdoor1.trapdoor1_close()
	pass
