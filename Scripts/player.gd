extends CharacterBody2D

@export var speed = 100

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@export var inv: Inv

var last_direction: Vector2 = Vector2.DOWN

#Handles player movement
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction != Vector2.ZERO:
		last_direction = direction
	
	if direction.y < 0:
		animated_sprite.play("move_up")
	elif direction.y > 0:
		animated_sprite.play("move_down")
	elif direction.x != 0:
		animated_sprite.play("move_sides")
		animated_sprite.flip_h = direction.x > 0
	else:
		if last_direction.y < 0:
			animated_sprite.play("idle_back")
		elif last_direction.y >0:
			animated_sprite.play("idle_front")
		else:
			animated_sprite.play("idle_side")
	

	velocity = direction * speed
	
	move_and_slide()


func collect(item):
	inv.intsert(item)
	
