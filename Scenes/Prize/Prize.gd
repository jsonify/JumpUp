extends Area2D

onready var animation_player := $AnimationPlayer

signal prize_collected

func _on_Prize_body_entered(_body: Node) -> void:
	animation_player.play("bounce")
	emit_signal("prize_collected")
	set_collision_mask_bit(1, false)
