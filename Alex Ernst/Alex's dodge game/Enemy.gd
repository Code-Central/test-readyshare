extends RigidBody2D

#initialize variables
var minSpeed
var maxSpeed
var enemyTypes

func _ready():
	minSpeed = 100
	maxSpeed = 200
	enemyTypes = randi() % 3
	
	#check which enemy it is
	if (enemyTypes == 0):
		get_node("AnimatedSprite").animation = "enemy0"
	elif (enemyTypes == 1):
		get_node("AnimatedSprite").animation = "enemy1"
	elif (enemyTypes == 2):
		get_node("AnimatedSprite").animation = "enemy2"
		
		get_node("AnimatedSprite").play()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
