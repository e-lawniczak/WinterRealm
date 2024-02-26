extends CharacterBody2D

var speed = 750
var v  = Vector2.ZERO
signal bullet_hit

func _physics_process(delta):
	velocity = velocity.normalized() * speed * delta
	var info = move_and_collide(velocity)


func _on_bullet_hit():
	print("bullet hit signal")
	queue_free()


func _on_area_2d_area_entered(area):
	print(area.name)
	if area.is_in_group("mobs"):
		area.queue_free()
	queue_free()
