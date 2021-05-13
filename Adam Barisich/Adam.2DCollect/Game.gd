extends Node

func _ready():
	randomize()
	get_node("CoinSpawner").set_wait_time(rand_range(1, 2))
	get_node("CoinSpawner").start()

func _on_CoinSpawner_timeout():
	var newCoinPath = load("res://Coin.tscn")
	var newCoin = newCoinPath.instance()
	get_parent().add_child(newCoin)
	get_node("CoinSpawner").set_wait_time(rand_range(1, 2))
	get_node("CoinSpawner").start()
