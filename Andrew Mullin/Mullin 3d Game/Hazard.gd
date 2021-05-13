extends Area



func _on_Hazard_body_entered(body):
	if body is KinematicBody:
		get_tree().reload_current_scene()