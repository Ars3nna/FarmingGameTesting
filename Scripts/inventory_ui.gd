extends Control

var is_open = false

func _ready() -> void:
	close()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("inv_open"):
		if is_open:
			close()
		else:
			open()
	if Input.is_action_just_pressed("esc") and is_open == true:
		close()
	
func open():
	visible = true
	is_open = true
	get_tree().paused = true
	
func close():
	visible = false
	is_open = false
	get_tree().paused = false
