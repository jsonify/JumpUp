extends Area2D

onready var animation_player := $AnimationPlayer

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body: Node):
	animation_player.play("destroy")
	apply_checkpoint(body)

func apply_checkpoint(body: Node):
	pass
