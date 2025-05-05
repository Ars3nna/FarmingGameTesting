extends StaticBody2D

var first_dialogue_text: Array = ["Welcome newcommer, good to meet you. I've
 gone ahead and given you some tools to get you started. Visit the merchant
 for some seeds and other items. Would you like me to teach you the ropes?"]

var player_options: Array = ["Yes please.", "No thanks."]

var tutorial_dialogue: Array = []

var player_in_range = false
var ready_for_interaction = false

func _ready() -> void:
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)
	$Area2D.input_event.connect(_on_area_input)

func _on_body_entered(body):
	if body.name == "Player":
		player_in_range = true

func _on_body_exited(body):
	if body.name == "Player":
		player_in_range = false

func _process(delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("interact"):
		open_dialogue()
	
func _on_area_input(viewport, event, shape_idx):
	if player_in_range and event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			open_dialogue()
	
func open_dialogue():
	var dialogue_ui = get_tree().current_scene.get_node("Hunter dialogue canvas/Hunter dialogue")
	dialogue_ui.start_dialogue(first_dialogue_text, player_options)
