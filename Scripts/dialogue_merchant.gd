extends CanvasLayer

@export var d_file: String
var dialogue = []
var current_dialogue_id = 0
var d_active = false
var first_dialogue = true

func _ready() -> void:
	$NinePatchRect.visible = false

func start() -> void:
	if d_active:
		return
	d_active = true
	$NinePatchRect.visible = true
	
	dialogue = load_dialogue()
	next_script()

func load_dialogue():
	if FileAccess.file_exists(d_file):
		var file = FileAccess.open(d_file, FileAccess.READ)
		var content = file.get_as_text()
		file.close()
		
		if content.is_empty():
			return []
		
		var data = JSON.parse_string(content)
		if typeof(data) == TYPE_ARRAY:
			return data
	return []
	
func _input(event: InputEvent) -> void:
	if not d_active:
		return
	if event.is_action_pressed("interact") and first_dialogue == true:
		dialogue.remove_at(0)
		first_dialogue == false
		return
	elif event.is_action_pressed("interact") and first_dialogue == false:
		next_script()
		
func next_script():
	if current_dialogue_id >= len(dialogue):
		d_active = false
		$NinePatchRect.visible = false
		return
	
	$NinePatchRect/Name.text = dialogue[current_dialogue_id]["name"]
	$NinePatchRect/Chat.text = dialogue[current_dialogue_id]["text"]
