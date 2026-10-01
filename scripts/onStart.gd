extends Node2D

@onready var icon = $Sprite2D
@onready var timer = $Timer
@onready var shown = 0

func _ready():
	icon.modulate.a = 0.0



func fadeIn():
	var tween = create_tween()
	tween.tween_property(icon, "modulate:a", 1.0, 1.5)
	shown = 1
	timer.wait_time = 3
	timer.start()
	
func fadeOut():
	var tween = create_tween()
	tween.tween_property(icon, "modulate:a", 0.0, 1.5)
	shown = 2
	timer.wait_time = 2
	timer.start()

func _on_timer_timeout():
	if shown == 0:
		fadeIn()
	elif shown == 1:
		fadeOut()
	elif shown == 2:
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
