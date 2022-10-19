extends Node2D

onready var player := $Player
onready var player_animation := $Player/Sprite
onready var minutes := $HUD/Right/Panel2/TimerMins
onready var seconds := $HUD/Right/Panel2/TimerSecs
onready var finish_area := $Finish
onready var info_label := $CanvasLayer/Info
onready var leftPanel = $HUD/Left
onready var rightPanel = $HUD/Right

var current_time
var bonus := 0

func _ready():
	finish_area.connect("body_entered", self, "_on_Finish_body_entered")
	# turn the physics_process off to prevent the player from moving
	player.set_physics_process(false)
	
	# turn the physics_process off to prevent the time from increasing	
	minutes.set_physics_process(false)
	# turn the timer flag to off
	minutes.timer_on = false
	seconds.set_physics_process(false)
	seconds.timer_on = false
	player_animation.animation = "Idle"

func _process(delta: float) -> void:
	current_time = (minutes.minutes) * 60 + seconds.seconds
	
func start():
	player.set_physics_process(true)
	minutes.set_process(true)
	minutes.timer_on = true
	seconds.set_process(true)
	seconds.timer_on = true
	player_animation.animation = "Running"

func finish_level():
	set_process(false)
	leftPanel.visible = false
	rightPanel.visible = false
	player.set_physics_process(false)
	player_animation.playing = false
	info_label.rect_scale = Vector2.ONE
	info_label.get_font("font").size = 64
	info_label.show()
	info_label.text = "Time: %02d : %02d\nScore: %02d" % [minutes.minutes, seconds.seconds, current_time]

func _on_Finish_body_entered(body: Node) -> void:
	finish_level()
