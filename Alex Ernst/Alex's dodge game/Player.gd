extends Area2D

signal hit

#Set up variables.
var speed
var move

func _ready():
	speed = 300
	move = Vector2()
	position = get_viewport_rect().size / 2
	
	#you are on page 35 (You have more sprites)
func _process(delta):
	move = Vector2()
	
	if (Input.is_action_pressed("ui_left")):
		move.x -= 1
	if (Input.is_action_pressed("ui_right")):
		move.x += 1
	if (Input.is_action_pressed("ui_up")):
		move.y -= 1
	if (Input.is_action_pressed("ui_down")):
		move.y += 1
		
	if (move.length() > 0):
		get_node("AnimatedSprite").play()
	else:
		get_node("AnimatedSprite").stop()
		get_node("AnimatedSprite").frame = 0
		
	move.normalized()
	position += move * speed * delta
	position.x = clamp(position.x, 0, get_viewport().size.x)
	position.y = clamp(position.y, 0, get_viewport().size.y)
	
	

func _on_Player_body_entered(body):
	hide()
	get_node("CollisionShape2D").set_deferred("disabled", true)
	emit_signal("hit")
