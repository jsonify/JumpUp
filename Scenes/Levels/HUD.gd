extends CanvasLayer

var score := 0

func _ready() -> void:
	$Prizes.text = str(score)

func _process(_delta: float) -> void:
	print(score)
	if score == 50:
		get_tree().change_scene("res://Scenes/Game.tscn")

func _on_prize_collected() -> void:
	score += 5
	_ready()
