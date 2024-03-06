extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if randi() % 2 == 0:
		$TextureRect.texture = load("res://assets/images/icons/milk_icon.png")
	else:
		$TextureRect.texture = load("res://assets/images/icons/cereal_icon.png")
