extends "Checkpoint.gd"

signal checkpoint1_reached

func _on_Checkpoint1_body_entered(body: Node) -> void:
	if body is Player:
		print("Checkpoint1 accessed")

func apply_checkpoint(body: Node):
	emit_signal("checkpoint1_reached")
