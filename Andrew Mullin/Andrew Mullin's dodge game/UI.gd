extends CanvasLayer

signal startGame

func _on_Start_pressed():
	get_node("Start").hide()
	emit_signal("startGame")
	

func _on_MessageTimer_timeout():
	get_node("Message").hide()
	
func showMessage(text):
	get_node("Message").text = text
	get_node("Message").show()
	get_node("MessageTimer").start()
	
func showGameOver():
	showMessage("Looks like you've got yourself in a real pickle")
	yield(get_node("MessageTimer"), "timeout")
	get_node("Message").text = "THIS IS ANDREW'S BIRD DODGE GAME"
	get_node("Message").show()
	get_node("Start").show()
func updateScore(score):
	get_node("Score").text = str(score)