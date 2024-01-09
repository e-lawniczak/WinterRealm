extends CharacterBody2D

@export var speed = 200
var isChasing = false
var player = null

	
func _physics_process(delta):
	var v = Vector2.ZERO
	if(isChasing):
		v += (player.position - position).normalized()
		velocity = v * speed
		$AnimatedSprite2D.play()
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.stop()
		
	position += velocity * delta
	
	

func _on_detection_area_body_entered(body):
	print("bodyentered")
	player = body
	isChasing = true


func _on_detection_area_body_exited(body):
	print("bodyexited")
	player = null
	isChasing = false


func _on_body_body_entered_2(body):
	player.hit()
