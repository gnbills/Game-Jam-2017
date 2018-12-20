extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal get_coin

func _on_body_enter( body ):
	emit_signal("get_coin")
	queue_free()

func _ready():
	var Player = get_node("/root/Node2D/Player")
	connect("get_coin", Player, "_add_coin", [1])
	connect("body_enter", self, "_on_body_enter")