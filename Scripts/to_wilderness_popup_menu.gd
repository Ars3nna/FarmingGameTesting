extends Control

var dialogue_lines = ["This is the wilderness. It's dangerous,
so you need to bring food for your trip.", "Enter the wilderness?"]

func _ready() -> void:
	$"Wilderness dialogue/Enter button".visible = false
	$"Wilderness dialogue/Exit button".visible = false
	$"Wilderness dialogue/Enter button".disabled = true
	$"Wilderness dialogue/Exit button".disabled = true
	process_mode = Node.PROCESS_MODE_ALWAYS
	visible = false

func show_popup():
	$"Wilderness dialogue/RichTextLabel".text = dialogue_lines[0]
	visible = true
	$"Wilderness dialogue/Enter button".visible = false
	$"Wilderness dialogue/Exit button".visible = false
	$"Wilderness dialogue/Enter button".disabled = true
	$"Wilderness dialogue/Exit button".disabled = true
	await get_tree().process_frame
	get_tree().paused = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("space") or event.is_action_pressed("interact"):
		$"Wilderness dialogue/RichTextLabel".text = dialogue_lines[1]
		await get_tree().create_timer(.2).timeout
		$"Wilderness dialogue/Enter button".visible = true
		$"Wilderness dialogue/Exit button".visible = true
		$"Wilderness dialogue/Enter button".disabled = false
		$"Wilderness dialogue/Exit button".disabled = false
	
func _on_exit_button_pressed() -> void:
	get_tree().paused = false
	visible = false
	
func _on_enter_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/wilderness.tscn")
