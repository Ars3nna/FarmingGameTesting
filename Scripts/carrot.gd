extends Node2D

var player_in_area

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if player_in_area:
		if Input.is_action_just_pressed("interact"):
			queue_free()
