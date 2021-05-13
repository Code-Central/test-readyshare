extends Area2D


var direction
var speed
var width
var height

func _ready():
	position = get_viewport_rect().size / 2
	direction = Vector2()
	speed = 700
	direction.x = rand_range(-1, 1)
	direction.y = rand_range(-1, 1)
	direction = direction.normalized()
	width = get_viewport_rect().size.x
	height = get_viewport_rect().size.y
	get_parent().get_node("Lose").hide()
func _process(delta):
	position += direction * speed * delta
	if position.x < 0 or position.x > width:
		direction.x *= -1
	if position.y < 0 or position.y > height:
		direction.y *= -1


# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Bomb_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		queue_free()
		get_parent().get_node("UFO").queue_free()
		get_parent().get_node("Explode")
		get_parent().get_node("Lose").show()
#		get_parent().get_node("RestartScene").set_wait_time(7)
		get_parent().get_node("RestartScene").start()