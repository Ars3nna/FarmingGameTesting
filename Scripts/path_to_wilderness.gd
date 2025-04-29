extends Area2D

@export var popup: Control

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		popup.show_popup()
