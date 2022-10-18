extends Label

var time = 55
var timer_on := false

func _ready() -> void:
    timer_on = true

func _process(delta):
    if (timer_on):
        if time > 60:
            modulate.a = 1
        else:
            modulate.a = 0
            
        time += delta
        
        var minutes = fmod(time, 60 * 60) / 60
        var minutes_passed = "%01d" % [minutes]
        text = minutes_passed