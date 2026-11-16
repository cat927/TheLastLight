extends Node2D

@onready var UI = $UI
@onready var game = $"."

func _ready():
	var starting_enemys = [['moth', 500, 0, 'base'], ['moth', -200, 0, 'base']]
	for i in range(4):
		var heart = preload("res://UI/heart/heart.tscn").instantiate()
		heart.get_node("AnimatedSprite2D").healthID = i
		UI.add_child(heart)
	for i in range(starting_enemys.size()):
		var enemy = starting_enemys[i-1]
		global.spawn_enemy(enemy[0], enemy[1], enemy[2], enemy[3])
