extends Node2D

@onready var UI = $UI

func _ready():
	for i in range(4):
		var heart = preload("res://UI/heart/heart.tscn").instantiate()
		heart.get_node("AnimatedSprite2D").healthID = i
		UI.add_child(heart)
