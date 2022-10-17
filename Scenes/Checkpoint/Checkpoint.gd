extends Area2D

onready var animation_player := $AnimationPlayer

signal checkpoint_reached

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body: Node):
	animation_player.play("destroy")
	apply_checkpoint(body)
	


# This is for future features when a player crosses a general checkpoint. Possibly save location
# using Autoload so that if the game ends, that's the restart point
func apply_checkpoint(_body: Node):
	emit_signal("checkpoint_reached")
