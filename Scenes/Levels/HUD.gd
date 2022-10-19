extends CanvasLayer

var score := 0

func _ready() -> void:
	$Left/Prizes.text = str(score)

func _process(_delta: float) -> void:
#	if score == 45:
#		get_tree().change_scene("res://Scenes/Game.tscn")
	pass

func _on_prize_collected() -> void:
	score += 5
	_ready()
