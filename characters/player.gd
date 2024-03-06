extends CharacterBody2D

#signal hit

@export var speed = 600
@export var bullet :PackedScene
var able_to_fire = true
var timer = null
@export var bullet_delay = 0.3


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = bullet_delay
	

func _on_timer_timeout():
	able_to_fire = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	position += velocity * delta
	look_at(get_global_mouse_position())
	$Node2D.look_at(get_global_mouse_position())
	$Node2D/bullet_spawn.look_at(get_global_mouse_position())
	
	if(Input.is_action_pressed("shoot") && able_to_fire):
		fire()

func hit():
	print("collsion")
	kill()
	queue_free()
	


func fire():
	var b = bullet.instantiate()
	get_parent().add_child(b)
	b.position = $Node2D/bullet_spawn.global_position
	b.velocity = get_global_mouse_position() - b.position
	able_to_fire = false
	$Timer.start()
	
func kill():
	get_tree().reload_current_scene()


func _on_hitbox_area_entered(area):
	
	if "enemy" in area.name:
		hit()
		
	



