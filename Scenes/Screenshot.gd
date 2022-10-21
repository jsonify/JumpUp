extends Camera2D

var level_number = 0
export var number_of_levels : int
onready var target_viewport = get_tree().root.get_viewport()
var starting_pos := Vector2.ZERO
onready var art = get_node("%Art")
onready var collectables = get_node("%Collectables")

func _ready():
	starting_pos = self.global_position
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("screenshot"):
		setup()
		yield(get_tree().create_timer(0.2), "timeout")
		iterate()
		
func setup():
	pass
	
func iterate():
	pass
