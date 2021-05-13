extends CanvasLayer

signal startGame

var minutes = 0
	
func _ready():
	pass
	

func _on_Start_pressed():
	get_node("Start").hide()
	emit_signal("startGame")
	get_node("Message").show()
	get_node("MessageTimer").start()


func _on_MessageTimer_timeout():
	get_node("Message").hide()
	
func showMessage(text):
	get_node("Message").text = text
	get_node("Message").show()
	get_node("MessageTimer").start()
	
func ShowGameOver():
	showMessage("DEATH")
	yield(get_node("MessageTimer"), "timeout")
	get_node("Message").text = "german bird dodge"
	get_node("Message").show()
	get_node("Start").show()
	get_node("MessageTimer").start()
	
	
func updatedScore(score):
	minutes = (score - (score % 60)) / 60
	score = score % 60
	if score < 10:
		get_node("Score").text = "TIME LIVED "+str(minutes)+":0"+str(score) 
	else:
		get_node("Score").text = "TIME LIVED "+str(minutes)+":"+str(score)
	
	# ON PAGE 31
