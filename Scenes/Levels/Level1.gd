extends Node2D

onready var player := $Player
onready var minutes := $HUD/Right/Panel2/TimerMins
onready var seconds := $HUD/Right/Panel2/TimerSecs

func _ready():
	# turn the physics_process off to prevent the player from moving
	player.set_physics_process(false)
	
	# turn the physics_process off to prevent the time from increasing	
	minutes.set_physics_process(false)
	# turn the timer flag to off
	minutes.timer_on = false
	seconds.set_physics_process(false)
	seconds.timer_on = false
	
func start():
	player.set_physics_process(true)
	minutes.set_process(true)
	minutes.timer_on = true
	seconds.set_process(true)
	seconds.timer_on = true
	
	
