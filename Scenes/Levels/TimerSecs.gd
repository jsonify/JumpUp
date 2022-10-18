extends Label

var time = 0
var timer_on := false

func _ready() -> void:
    timer_on = true

func _process(delta):
    if (timer_on):
        time += delta
        
        var seconds = fmod(time, 60)
        var seconds_passed = "%02d" % [seconds]
        text = seconds_passed