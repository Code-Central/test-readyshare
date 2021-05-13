extends Node2D


func _on_RestartScene_timeout():
	get_tree().reload_current_scene()
