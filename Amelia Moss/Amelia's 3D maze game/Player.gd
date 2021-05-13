extends KinematicBody

var moveSpeed
var rotateSpeed

func _ready():
	
	moveSpeed = 10.0
	rotateSpeed = 3.0
	
func _process(delta):
	
	var move = 0
	var rotate = 0 
	
	
	if (Input.get_action_strength("ui_down")):
		move = 1 
		
	if (Input.get_action_strength("ui_up")):
		move = -1
		
	if (Input.get_action_strength("ui_left")):
		rotate = 1
		
	if (Input.get_action_strength("ui_right")):
		rotate = -1
		
		
	rotation.y += rotate * rotateSpeed * delta
		
		
	var direction = Vector3(0, 0, 1).rotated(Vector3(0,1,0), rotation.y)
	var motion = direction * move * delta * moveSpeed
		
		
	move_and_collide(motion)