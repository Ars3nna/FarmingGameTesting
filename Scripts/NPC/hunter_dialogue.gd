extends Control

@onready var text_label = $Panel/Label
@onready var options_container = $Panel/VBoxContainer

func start_dialogue(dialogues: Array, options: Array):
	visible = true
	text_label.text = dialogues[0]
	for i in options_container.get_children():
		i.queue_free()
		
	for option_text in options:
		var button = Button.new()
		button.text = option_text
		button.pressed.connect(_on_option_pressed.bind(option_text))
		options_container.add_child(button)
		
func _on_option_pressed(option_text):
	print("Player selected: ", option_text)
	hide()
