extends Label

func _ready():
	self.modulate.a = 0.0


func fadeIn():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 1.5)


func _on_timer_timeout():
	fadeIn()
