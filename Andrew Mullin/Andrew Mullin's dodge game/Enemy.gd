extends RigidBody2D

# Declare member variables here. Examples:
var minspeed
var maxspeed
var enemyTypes

func _ready():
	minspeed = 150
	maxspeed = 300
	enemyTypes = randi() % 3
	
	
	if (enemyTypes == 0):
		get_node("AnimatedSprite").animation = "Enemy1"
	elif (enemyTypes == 1):
		get_node("AnimatedSprite").animation = "Enemy2"
	elif (enemyTypes == 2):
		get_node("AnimatedSprite").animation = "Enemy3"
	
	get_node("AnimatedSprite").play()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
