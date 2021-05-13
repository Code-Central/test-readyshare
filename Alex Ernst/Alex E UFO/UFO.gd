extends Area2D

# Declare member variables here. Examples:
var direction
var speed
var width
var height
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	position = get_viewport_rect().size / 2
	direction = Vector2()
	speed = 100
	direction.x = rand_range(-1,1)
	direction.y = rand_range(-1,1)
	direction = direction.normalized()
	width = get_viewport_rect().size.x
	height = get_viewport_rect().size.y
	score = 0
	
	#this increases the speed!
func _process(delta):
	position += direction * speed * delta 
	if position.x < 0 or position.x > width:
		direction.x *= -1
	if position.y < 0 or position.y > height:
		direction.y *= -1
		
#this makes it so that the ufo teleports!
func _on_UFO_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		direction.x = rand_range(-1,1)
		direction.y = rand_range(-1,1)
		direction = direction.normalized()
		position.x = rand_range(0, width)
		position.y = rand_range(0, height)
		speed += 5
		var newBombPath = load("res://Bomb.tscn")
		var newBomb = newBombPath.instance()
		get_parent().add_child(newBomb)
		newBomb.speed += 1000
		get_parent().get_node("HitSound").play()
		score += 1
		get_parent().get_node("Score").text = "You suck at this IDIOT \nScore: " + str(score)