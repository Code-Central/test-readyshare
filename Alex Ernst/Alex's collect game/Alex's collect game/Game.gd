extends Node

func _ready():
	randomize()
	get_node("CoinPooperOuter").set_wait_time(rand_range(1, 5))
	get_node("CoinPooperOuter").start()
	get_node("Bomb spawner").set_wait_time(rand_range(2, 6))
	get_node("Bomb spawner").start()

func _on_CoinPooperOuter_timeout():
	var newCoinPath = load("res://Coin.tscn")
	var newcoin = newCoinPath.instance()
	get_parent().add_child(newcoin)
	get_node("CoinPooperOuter").set_wait_time(rand_range(1, 5))

func _on_Bomb_spawner_timeout():
		var newBombPath = load("res://Bomb.tscn")
		var newBomb = newBombPath.instance()
		get_parent().add_child(newBomb)
		get_node("Bomb spawner").set_wait_time(rand_range(2, 6))
		
