extends "Checkpoint.gd"

signal checkpoint2_reached

func _on_Checkpoint2_body_entered(body: Node) -> void:
	if body is Player:
		print("Checkpoint 2 accessed")

func apply_checkpoint(_body: Node):
	emit_signal("checkpoint2_reached")


