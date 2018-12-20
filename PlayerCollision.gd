extends KinematicBody2D

const GRAVITY = 200.0
const WALK_SPEED = 200
var number_of_coins = 0
var has_won = false

var velocity = Vector2()

func _fixed_process(delta):
	velocity.y += delta * GRAVITY + (number_of_coins * 3)
	if(is_colliding()):
		velocity.y = 0
	if (Input.is_action_pressed("Player_Move_Left") and !has_won):
		velocity.x = - WALK_SPEED - (number_of_coins * 2)
	elif (Input.is_action_pressed("Player_Move_Right") and !has_won):
		velocity.x =   WALK_SPEED - (number_of_coins * 2)
	else:
		velocity.x = 0
	if (Input.is_action_pressed("Player_Jump") and (velocity.y == 0) and !has_won ):
		velocity.y = -(GRAVITY) - (number_of_coins * 2)
		get_node("Sound").play("bounce")
	if (get_pos().y >= 515):
		velocity.y = 0
		lose_game()


	var motion = velocity * delta
	motion = move(motion)

func _add_coin( number ):
	get_node("Sound").play("coin")
	number_of_coins += number
	
func lose_game():
	set_fixed_process(false)
	var game_over = load("res://GameOver.tscn")
	var scene_instance = game_over.instance()
	scene_instance.set_name("game_over")
	add_child(scene_instance)
	
func get_number_of_coins():
	print(number_of_coins)
	return number_of_coins
	
func Win_Game():
	has_won = true
	get_node("Sound").play("applause")
	var you_win = load("res://WinScreen.tscn")
	var scene_instance = you_win.instance()
	scene_instance.set_name("you_win")
	add_child(scene_instance)


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	#connect("got_coin", self, "get_number_of_coins")
	#set_process_input(true)
