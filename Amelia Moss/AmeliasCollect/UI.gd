extends CanvasLayer

signal startgame


func _on_Message_Timer_timeout():
	get_node("Message").hide()
	
func showMessage(text):
	get_node("Message").text = text 
	get_node("Message").show()
	get_node("MessageTimer").start()
	
func showGameOver():
	showMessage("You've met with a terrible fate,\nhaven't you?")
	yield(get_node("MessageTimer"), "timeout")
	get_node("Message").text = "Bird Attack!"
	get_node("Message").show()
	get_node("Start").show()
	
func updatedScore(score):
	get_node("Score").text = str(score)

func _on_Start_pressed():
	get_node("Start").hide()
	emit_signal("startgame")