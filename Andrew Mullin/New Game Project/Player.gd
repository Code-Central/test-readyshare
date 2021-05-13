extends KinematicBody

var moveSpeed
var rotateSpeed

func _ready():
	#Player Variables
	moveSpeed = 10.0
	rotateSpeed = 3.0
	
func _process(delta):
	#Local Variables
	var move = 0
	var rotate = 0
	
	#Get input
	if (Input.get_action_strength("ui down")):
		move = 1