extends Label

var time = 0
var timer_on := false
var minutes := 0

func _ready() -> void:
	timer_on = true

func _process(delta):
	if (timer_on):
		if time > 60:
			modulate.a = 1
		else:
			modulate.a = 0
			
		time += delta
		
		minutes = fmod(time, 60 * 60) / 60
		var minutes_passed = "%01d" % [minutes]
		text = minutes_passed
