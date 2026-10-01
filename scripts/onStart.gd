extends Node2D

@onready var icon = $Sprite2D


func _ready():
	icon.modulate.a = 0.0


func fadeIn():
	var tween = create_tween()
	tween.tween_property(icon, "modulate:a", 1.0, 1.5)


func _on_timer_timeout():
	fadeIn()
