extends StaticBody2D

var player_in_range = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_range = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		player_in_range = false
		
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_in_range == true:
		start_dialogue()
		
func start_dialogue():
	$"../Merchant dialogue".start()
