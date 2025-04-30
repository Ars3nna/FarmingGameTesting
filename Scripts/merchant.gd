extends StaticBody2D

var first_dialogue = true
var dialogue_finished_once = false
var player_in_range = false

func _ready() -> void:
	$"../Merchant dialogue".dialogue_finished.connect(_on_dialogue_finished)
	
func _on_dialogue_finished():
	dialogue_finished_once

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_range = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		player_in_range = false
		
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_in_range == true:
		var dbox = $"../Merchant dialogue"
		if dbox.d_active:
			return
			
		if first_dialogue:
			first_dialogue = false
			start_dialogue()
		elif dialogue_finished_once:
			start_dialogue()
			
func start_dialogue():
	$"../Merchant dialogue".start()
