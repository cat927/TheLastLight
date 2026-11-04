extends Label

@onready var timer = $Timer
@onready var shown = 0

func _ready():
	self.modulate.a = 0.0

func fadeIn():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 1.5)
	shown = 1

func fadeOut():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 1.5)
	shown = 2

func _on_timer_timeout():
	if shown == 0:
		fadeIn()
	elif shown == 1:
		fadeOut()
	
