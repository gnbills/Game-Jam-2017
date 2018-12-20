extends Area2D

signal Win_Game

func Pass_Flag( body ):
	emit_signal("Win_Game")

func _ready():
	var Player = get_node("/root/Node2D/Player")
	connect("Win_Game", Player, "Win_Game")
	connect("body_enter", self, "Pass_Flag")
	
