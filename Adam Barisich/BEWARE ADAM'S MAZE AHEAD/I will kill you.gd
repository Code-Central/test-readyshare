extends Area

var time = 1



func _on_I_will_kill_you_body_entered(body):
	if body is KinematicBody:
		get_node("Death").play()
		yield(get_tree().create_timer(time),"timeout")
		get_tree().reload_current_scene()
		