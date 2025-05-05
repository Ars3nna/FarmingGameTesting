extends Node2D

var player_in_area = false

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if !player_in_area:
		return
	if Input.is_action_just_pressed("interact"):
		queue_free()

func _on_pickup_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = true

func _on_pickup_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = false
