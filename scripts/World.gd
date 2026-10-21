extends Node2D

var Heart = preload("res://scenes/heart.tscn")
@onready var UI = $UI

func _ready():
	for i in range(4):
		var heart = Heart.instantiate().get_node("AnimatedSprite2D")
		heart.healthID += 1
		UI.add_child(heart)
