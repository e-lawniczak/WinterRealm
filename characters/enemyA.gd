extends CharacterBody2D

@export var speed = 200
@export var item :PackedScene
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
	player = body
	isChasing = true


func _on_detection_area_body_exited(body):
	player = null
	isChasing = false

func onKill():
	var range = 100
	for x in randi()%4 + 1:
		var rand_x = randf_range(-range, range)
		var rand_y = randf_range(-range, range)
		var i = item.instantiate()
		get_parent().add_child(i)
		i.position = $enemy_body.global_position - Vector2(rand_x, rand_y)
	queue_free()

func _on_enemy_body_area_entered(area):
	if area.is_in_group("bullets"):
		onKill()
