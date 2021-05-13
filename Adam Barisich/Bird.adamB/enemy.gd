extends RigidBody2D

var minspeed
var maxspeed
var enemyTypes

func _ready():
	minspeed = 800
	maxspeed = 2000
	enemyTypes = randi() % 3
	
	if (enemyTypes == 0):
		get_node("AnimatedSprite").animation = "enemy1"
	if (enemyTypes == 1):
		get_node("AnimatedSprite").animation = "enemy2"
	if (enemyTypes == 2):
		get_node("AnimatedSprite").animation = "enemy3"

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

