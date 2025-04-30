extends CanvasLayer

@export var d_file: String
var dialogue = []
var current_dialogue_id = 0
var d_active = false
var first_dialogue = true
var close_script =  false

func _ready() -> void:
	$NinePatchRect.visible = false
	$"Yes button rect".visible = false
	$"No button rect".visible = false
	$"Yes button rect/Yes button".disabled = true
	$"No button rect/No button".disabled = true
	dialogue = load_dialogue()

func start() -> void:
	if close_script == true:
		close_script = false
		return
	if d_active:
		return
		
	d_active = true
	$NinePatchRect.visible = true
	
	if first_dialogue:
		$NinePatchRect/Name.text = dialogue[current_dialogue_id]["name"]
		$NinePatchRect/Chat.text = dialogue[current_dialogue_id]["text"]
	else:
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
		
	if event.is_action_pressed("interact"):
		if first_dialogue:
			$NinePatchRect.visible = false
			d_active = false
			first_dialogue = false
			dialogue.remove_at(0)
			current_dialogue_id = 0
			close_script = true
		else:
			next_script()
		
func next_script():
	if current_dialogue_id >= len(dialogue):
		d_active = false
		$NinePatchRect.visible = false
		current_dialogue_id = 0
		return
		
	$NinePatchRect.visible = true
	$NinePatchRect/Name.text = dialogue[current_dialogue_id]["name"]
	$NinePatchRect/Chat.text = dialogue[current_dialogue_id]["text"]
	$"Yes button rect".visible = true
	$"No button rect".visible = true
	$"Yes button rect/Yes button".disabled = false
	$"No button rect/No button".disabled = false
	current_dialogue_id += 1
	
