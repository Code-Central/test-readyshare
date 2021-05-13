extends Area2D


var direction
var speed
var width
var height

func _ready():
	position = get_viewport_rect().size / 2
	direction = Vector2()
	speed = 150
	direction.x = rand_range(-1, 1)
	direction.y = rand_range(-1, 1)
	direction = direction.normalized()
	width = get_viewport_rect().size.x
	height = get_viewport_rect().size.y
func _process(delta):
	position += direction * speed * delta
	if position.x < 0 or position.x > width:
		direction.x *= -1
	if position.y < 0 or position.y > height:
		direction.y *= -1

func _on_Bomb_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		direction.x = rand_range(-1, 1)
		direction.y = rand_range(-1, 1)
		direction = direction.normalized()
		position.x = rand_range(0, width)
		position.y = rand_range(0, height)
		speed += 5
		speed += 5