extends Spatial

func _ready():
	get_node("WIN").hide()
	

func nextLevel(old, new):
	#Remove old level
	old.queue_free()
	
	#load new level
	var newLevelPath = load("res://" + new + ".tscn")
	if newLevelPath:
		var newLevel = newLevelPath.instance()
		add_child(newLevel)
	
	else:
		get_node("WIN").show()
	