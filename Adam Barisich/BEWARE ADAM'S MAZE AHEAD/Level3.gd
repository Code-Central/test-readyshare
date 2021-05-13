extends Spatial

func _ready():
	get_node("WIN").hide()

func _on_Goal_body_entered(body):
	 get_node("WIN").show()
