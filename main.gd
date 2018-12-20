extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#func _on_coin_body_enter( body ):
	#get_node("PlayerController")._add_coins(1)
	#print( str( get_node("PlayerController").get_number_of_coins() ) )
	#get_node("Coin").queue_free()
func add_coin():
	print("Hi")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	#get_node("Coin").connect("body_enter", self, "_on_coin_body_enter")