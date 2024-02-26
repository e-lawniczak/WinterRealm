extends CharacterBody2D

@export var speed = 200
var isChasing = false
var player = null

	
func _physics_process(delta):
	var v = Vector2.ZERO
	if(isChasing):
		v += (player.position - position).normalized()
		velocity = v * speed
		look_at(player.position)
		$AnimatedSprite2D.play()
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.stop()
		
	position += velocity * delta
	move_and_collide(v)
	
	

func _on_detection_area_body_entered(body):
	print("bodyentered")
	player = body
	isChasing = true


func _on_detection_area_body_exited(body):
	print("bodyexited")
	player = null
	isChasing = false


func _on_enemy_body_area_entered(area):
	print(area.name)
	if area.is_in_group("bullets"):
		queue_free()
