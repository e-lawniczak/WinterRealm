extends CharacterBody2D

var speed = 50
var isChasing = false
var player = null

	
func _physics_process(delta):
	print("process")
	if(isChasing):
		position += (player.position - position)/speed
	
	

func _on_detection_area_body_entered(body):
	print("bodyentered")
	player = body
	isChasing = true


func _on_detection_area_body_exited(body):
	print("bodyexited")
	player = null
	isChasing = false
