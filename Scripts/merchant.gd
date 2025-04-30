extends StaticBody2D

var first_dialogue = true
var player_in_range = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_range = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		player_in_range = false
		
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_in_range == true:
		if first_dialogue == true:
			first_dialogue = false
			start_dialogue()
			return
		else:
			await get_tree().create_timer(1).timeout
			start_dialogue()
			return
		
func start_dialogue():
	$"../Merchant dialogue".start()
