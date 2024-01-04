extends CharacterBody2D


var speed = 200
var player


func _ready():
	player = get_parent().get_node("Player")


func _phisics_process(delta):
	var v = Vector2.ZERO 
	var player_position = player.position
	var target = (player_position - position).normalized() * speed
	velocity = target * delta
	move_and_slide()
	look_at(player_position)
	
	
