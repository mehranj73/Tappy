extends Control

@onready var game_over_label = $GameOverLabel
@onready var press_space_label = $PressSpaceLabel
@onready var timer = $Timer

var _can_ress_space: bool = false


func _ready():
	GameManager.on_game_over.connect(on_game_over)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _can_ress_space:
		if Input.is_action_just_pressed("fly"):
			GameManager.load_game_scene()


func on_game_over() -> void:
	show()
	timer.start()
	
	
func run_sequence() -> void:
	game_over_label.hide()
	press_space_label.show()
	_can_ress_space = true

func _on_timer_timeout():
	run_sequence()
