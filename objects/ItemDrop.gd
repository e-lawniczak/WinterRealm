extends Area2D
@export var tex1 = preload("res://images/item_drops/particle_beige.png")
@export var tex2 = preload("res://images/item_drops/particle_blue.png")
@export var tex3 = preload("res://images/item_drops/particle_pink.png")
@export var tex4 = preload("res://images/item_drops/particle_green.png")

var texArray = [tex1, tex2, tex3, tex4]
var spriteTexture

# Called when the node enters the scene tree for the first time.
func _ready():
	spriteTexture = texArray[randi() % texArray.size()]
	$Sprite2D.texture = spriteTexture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func onPickup():
	print("implement equipment")
	$AudioStreamPlayer.play()
	$Sprite2D.texture = null
	await $AudioStreamPlayer.finished
	queue_free()
	
	
func _on_body_entered(body):
	if body.name == "Player":
		onPickup()
